class Customer < ApplicationRecord
	scope :is_jeevi, -> { where('name = ?', "jeevitha Boopathi")}
	has_one_attached :resume
end
