class Tour < ApplicationRecord
  belongs_to :destination
  has_many :packages
end
