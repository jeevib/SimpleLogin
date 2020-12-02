class User < ApplicationRecord
	has_secure_password

	validates_presence_of :email
    validates_uniqueness_of :email

    def say_secret_with_self
	    self.secret
	    # secret
	end

	protected

	def secret
		"secret"
	end
end
