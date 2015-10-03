class Restaurant
  include Mongoid::Document
  
  field :name, type: String
  field :boro, type: String
  field :street_num, type: Integer
  field :street_name, type: String
  field :zip_code, type: Integer
  field :cuisine, type: String
  field :inspection_date, type: String
  field :grade, type: String
end
