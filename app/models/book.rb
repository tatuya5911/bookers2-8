class Book < ApplicationRecord

  belongs_to :user

  validates :body, length: { in: 1..200}
  validates :title,:body, presence: true

end
