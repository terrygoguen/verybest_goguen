class User < ApplicationRecord
  mount_base64_uploader :image, ImageUploader

  # Direct associations

  has_many   :bookmarks,
             dependent: :destroy

  # Indirect associations

  has_many   :venues,
             through: :bookmarks,
             source: :venue

  has_many   :dishes,
             through: :bookmarks,
             source: :dish

  # Validations

  # Scopes

  def to_s
    name
  end
end
