class Availability < ActiveRecord::Base
	belongs_to :user
	validates :UserID,presence: true
end
