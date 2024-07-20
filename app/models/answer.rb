class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :body, presence: true, length: {minimum: 2}

  def formatted_created_at
    I18n.l(created_at, format: :long)
  end
end
