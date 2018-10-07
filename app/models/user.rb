class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_many :books
  has_many :rings

	scope :active, -> { where(deleted_at: nil) }

  # ファイルアップロード処理
  mount_uploader :image, ImageUploader

  # trueだと、ブラウザ閉じてもログイン保持できる
  def remember_me
    true
  end

end
