class Lodging < ApplicationRecord
  belongs_to :user
  has_many :review_lodgings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many_attached :images
  has_many_attached :videos
  validates :name, presence: true
  validates :daily_fee, presence: true
  validates :description, presence: true
  validates :rooms, presence: true
  validates :user_id, presence: true
  validates :location, presence: true
  validates :bathrooms, presence: true


  accepts_nested_attributes_for :review_lodgings, allow_destroy: true
  accepts_nested_attributes_for :reservations, allow_destroy: true

  def thumbnail input
    images[input].variant(resize: '300x300').processed
  end

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
