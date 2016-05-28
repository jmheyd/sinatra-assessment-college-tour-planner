class User < ActiveRecord::Base
	include Slugifiable::InstanceMethods
  has_secure_password
 	has_many :user_colleges
	has_many :colleges, through: :user_colleges

	def self.find_by_slug(slug)
			self.all.detect{|username| username.slug == slug}
	end
end