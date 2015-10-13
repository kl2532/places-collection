class Address
  include Mongoid::Document
  embedded_in :place
  
  field :street1, type: String
  field :street2, type: String
  field :city, type: String
  field :state, type: String
  field :zip_code, type: String
end
