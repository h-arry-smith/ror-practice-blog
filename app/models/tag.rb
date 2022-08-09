class Tag < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :tag, presence: true

  def self.find_by_slug(slug)
    Tag.find_by(tag: slug)
  end

  def self.clean_up_unused_tags
    Tag.all.each do |tag|
      tag.destroy if tag.articles.empty?
    end
  end

  def to_s
    tag
  end

  def to_param
    tag
  end
end
