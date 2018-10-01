class Ring < ApplicationRecord
    belongs_to :user
    has_many :vocabularies

    scope :active, -> { where(deleted_at: nil) }
end
