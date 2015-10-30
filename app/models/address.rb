class Address
  include Mongoid::Document
  embedded_in :place
  
  field :street1, type: String
  field :street2, type: String
  field :city, type: String
  field :state, type: String
  field :zip_code, type: String

  def full_address
  	street1 + " " + street2 + " " + city + ", " + state + " " + zip_code
  end

  validates :street1, :presence => { :message => "You must provide a street name."} 
  validates :city, :presence => { :message => "You must provide a city."} 
  validates :state, :presence => { :message => "You must provide a state."} 
  validates :zip_code, :presence => { :message => "You must provide a zip code."} 

end
