class Book < ApplicationRecord
    belongs_to :user
    has_many :sentences

    scope :active, -> { where(deleted_at: nil) }
end