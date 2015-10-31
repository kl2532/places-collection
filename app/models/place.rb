class Place
  include Mongoid::Document
  embeds_one :address
  belongs_to :user
  belongs_to :public_lists

  validates_associated :address

  field :name, type: String
  field :rating, type: Integer
  field :public_place, type: Boolean

  accepts_nested_attributes_for :address

  validates :name, :presence => { :message => "You must provide a name."} 
  validates :rating, :presence => { :message => "You must provide a rating."} 
end
