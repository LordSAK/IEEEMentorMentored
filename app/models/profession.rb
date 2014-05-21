class Profession < ActiveRecord::Base
	belongs_to :user, foreign_key: :UserID
	validates :UserID, presence: true
end
