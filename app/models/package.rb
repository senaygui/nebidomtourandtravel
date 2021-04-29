class Package < ApplicationRecord
  belongs_to :tour

	validates :package_title , :presence => true
end
