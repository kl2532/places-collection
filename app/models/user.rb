class User
  include Mongoid::Document
  include BCrypt

  mount_uploader :image, AvatarUploader

  has_many :places

  accepts_nested_attributes_for :places,
    :allow_destroy => true,
    :reject_if     => :all_blank

  attr_accessor :password
  
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_hash, :type => String

  before_save :encrypt_password

  validates :first_name, :presence => { :message => "You must provide a first name."} 
  validates :last_name, :presence => { :message => "You must provide a last name."} 
  validates :email, :presence => { :message => "You must provide an email."} 

  validates_associated :places

  def self.authenticate(email, password)
    if password_correct?(email, password)
      true
    else
      false
    end
  end
  
  def self.password_correct?(user_email, password)
    user = find_by_email user_email
    return if user.nil?
    user_pass = Password.new(user.password_hash)
    user_pass == password
  end

  protected
  
    def encrypt_password
      self.password_hash = Password.create(@password)
    end

end
