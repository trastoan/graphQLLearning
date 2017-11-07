class Performance < ApplicationRecord
	belongs_to :artist

	validates :title, presence: true, length: { minimum: 3 }
	validates :about, presence: true, length: { minimum: 5 }
	validates :place, presence: true, length: { minimum: 5 }

	has_many :applauses
end
