class Show < ApplicationRecord
     has_many :actors, as: :production, dependent: :destroy
end
