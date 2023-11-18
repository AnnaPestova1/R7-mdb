class Actor < ApplicationRecord
    belongs_to :production, polymorphic: true
end
