class Page < ApplicationRecord
  has_rich_text :body

  validates :title, :body, presence: true
  validates :title, :body, length: { minimum: 2 }
end
