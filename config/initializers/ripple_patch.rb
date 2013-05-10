require 'ripple/indexes'
class Ripple::Index
  def to_index_value(value)
    value.to_ripple_index(index_type.to_s)
  end
end
