class Customer < ApplicationRecord
	scope :is_jeevi, -> { where('name = ?', "jeevitha Boopathi")}
	has_one_attached :resume
	before_create :confirmation_token

	def email_activate
	    self.email_confirmation = true
	    self.confirm_token_status = nil
	    save!(:validate => false)
	  end

	private
		def confirmation_token
		    if self.confirm_token_status.blank?
		        self.confirm_token_status = SecureRandom.urlsafe_base64.to_s
		    end
		end
end
