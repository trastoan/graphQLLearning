class Artist < ApplicationRecord
	has_secure_password

	validates :name, presence: true, length: { minimum: 3 }
	validates :email, presence: true, uniqueness: true

	has_many :performances
	has_many :applauses
end
