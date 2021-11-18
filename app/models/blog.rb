class Blog < ApplicationRecord
  belongs_to :user 
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favarites, source: :user 
  validates :title, presence: true, length: {minimum:1, maximum:30}
  validates :content, presence: true, length: {minimum:1, maximum:255}e
  mount_uploader :image, ImageUploader
end
