class Place
  include Mongoid::Document
  embeds_one :address
  belongs_to :users

  field :name, type: String
  field :rating, type: Integer
end