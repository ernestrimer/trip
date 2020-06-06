class Travel < ApplicationRecord
has_many :locations, dependent: :destroy
end
