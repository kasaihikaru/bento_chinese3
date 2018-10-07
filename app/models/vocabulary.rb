class Vocabulary < ApplicationRecord
    belongs_to :ring

  scope :active, -> { where(deleted_at: nil) }
  scope :created_desc, -> { order("created_at DESC") }
  scope :memorized_ja, -> { where(memorized_ja: true) }
  scope :memorized_ch, -> { where(memorized_ch: true) }
  scope :memorized_pin, -> { where(memorized_pin: true) }
  scope :unmemorized_ja, -> { where(memorized_ja: false) }
  scope :unmemorized_ch, -> { where(memorized_ch: false) }
  scope :unmemorized_pin, -> { where(memorized_pin: false) }
  scope :pin_fixed, -> { where(pin_fixed: true) }

  def self.search_ja(search_ja)
    if search_ja
      where(['ja LIKE ?', "%#{search_ja}%"])
    else
      all
    end
  end

  def self.search_ch(search_ch)
    if search_ch
      where(['ch LIKE ?', "%#{search_ch}%"])
    else
      all
    end
  end
end
