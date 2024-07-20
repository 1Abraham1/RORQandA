class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}

  def formatted_created_at
    # I18n.l(created_at, :format => '%d %B %Y, %H:%M')
    I18n.l(created_at, format: :long)
  end
end