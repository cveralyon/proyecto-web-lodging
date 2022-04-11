class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email, email: true, uniqueness: true, presence: true
  has_many :lodgings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :review_users_received, class_name: 'ReviewUser', foreign_key: 'received_id' , dependent: :destroy
  has_many :review_users_made, class_name: 'ReviewUser', foreign_key: 'made_id' , dependent: :destroy
  has_many :inbox_as_messageSender, class_name: 'Message', foreign_key: 'messageSender_id' , dependent: :destroy
  has_many :inbox_as_messageReceiver, class_name: 'Message', foreign_key: 'messageReceiver_id' , dependent: :destroy
  has_many :sended_reports, class_name: 'Report', foreign_key: 'reportSender_id' , dependent: :destroy
  has_many :received_reports, class_name: 'Report', foreign_key: 'reportReceiver_id' , dependent: :destroy


  accepts_nested_attributes_for :lodgings, allow_destroy: true
  accepts_nested_attributes_for :reservations, allow_destroy: true
  accepts_nested_attributes_for :review_users_received, allow_destroy: true
  accepts_nested_attributes_for :review_users_made, allow_destroy: true
  accepts_nested_attributes_for :inbox_as_messageSender, allow_destroy: true
  accepts_nested_attributes_for :inbox_as_messageReceiver, allow_destroy: true
  accepts_nested_attributes_for :sended_reports, allow_destroy: true
  accepts_nested_attributes_for :received_reports, allow_destroy: true


end
