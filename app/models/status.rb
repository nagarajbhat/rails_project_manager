class Status < ActiveRecord::Base
	has_many :roles
	validates :title, :presence => true

	
end
