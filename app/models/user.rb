class User
	include Mongoid::Document

	field :first-name, :type => String
	field :last-name, :type => String
	field :email, :type=> String
	field :location, :type => String
	field :phone-number, :type => Integer
	field :join-date, :type => Date

end