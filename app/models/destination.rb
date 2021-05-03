class Destination < ApplicationRecord
	has_many :tours
	has_many_attached :medias
end
