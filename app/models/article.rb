class Article < ApplicationRecord
  validates :title, :body, :slug, presence: true
  validates :title, :body, :slug, length: { minimum: 2 }
  validates :slug, uniqueness: true

  has_and_belongs_to_many :tags

  def remove_tag(tag)
    tags.delete(tag)
  end

  def to_param
    slug
  end

  def self.find_by_slug(slug)
    Article.find_by(slug: slug)
  end
end
