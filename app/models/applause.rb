class Applause < ApplicationRecord
  belongs_to :performance, validate: true
  belongs_to :artist, validate: true
end
