class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :name, :password_digest,:contact_no, presence: true
  validates :password, length: {minimum: 6}, presence:true
  belongs_to :entity , polymorphic:true
  has_one :address
end
