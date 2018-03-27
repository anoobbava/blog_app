# encoding: utf-8

class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]
  attr_accessor :login
  validates :user_name, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :user_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  mount_uploader :image, ImageUploader
  acts_as_voter

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(user_name) = :value OR lower(email) = :value",
                                      { value: login.downcase }]).first
    elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end
