class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :restrict_access

  def restrict_access
    begin 
      begin
        secret = ApiKey.find(params[:api_key].to_s).secret
      rescue
        raise StandardError.new("Could not find user with key: #{param[:api_key]}")
      end

      authentication_hash = URI.decode(request.headers["AUTHORIZATION"])
      raise StandardError.new("No HASH provided") if authentication_hash.blank?

      computed_token = Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'), secret, URI.decode(request.query_string)))
      unless authentication_hash == computed_token
        raise StandardError.new("Token mismatch when checking authentication")
      end
    rescue StandardError
      not_authorized
    end 
  end

  def not_authorized
    render :json => {}, :status => :unauthorized
  end
end
