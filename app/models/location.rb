class Location < ApplicationRecord
  belongs_to :travel
  has_one :address, dependent: :destroy
end
