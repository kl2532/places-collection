class PublicList
  include Mongoid::Document
  belongs_to :user
  has_and_belongs_to_many :places

  field :name, type: String
  field :description, type: String

  validates :name, :presence => { :message => "You must provide a name."} 
  validates :description, :presence => { :message => "You must provide a description."} 
  validates_associated :places

  accepts_nested_attributes_for :places
end
