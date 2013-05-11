class Pet
  include Ripple::EmbeddedDocument

  property :name, String, :presence => true
  property :weight, String
  property :kind, String, :presence => true
  property :breed, String
  
  KINDS = ["Dog", "Cat", "Fish", "Reptile", "Rodent", "other"]
end