class Article < ApplicationRecord
  validates :title, :body, :slug, presence: true
  validates :title, :body, :slug, length: { minimum: 2 }
  validates :slug, uniqueness: true
end
