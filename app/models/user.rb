class User < ApplicationRecord
  has_secure_password
  
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
end