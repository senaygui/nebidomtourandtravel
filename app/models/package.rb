class Package < ApplicationRecord
  belongs_to :tour
  has_many :package_checklists

  accepts_nested_attributes_for :package_checklists, reject_if: :all_blank, allow_destroy: true

	validates :package_title , :presence => true
end
