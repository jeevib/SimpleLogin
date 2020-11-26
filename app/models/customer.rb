class Customer < ApplicationRecord
	scope :is_jeevi, -> { where('name = ?', "jeevitha Boopathi")}
end
