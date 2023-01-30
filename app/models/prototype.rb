class Prototype < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concepet, presence: true
  validates :image, presence: true
end
