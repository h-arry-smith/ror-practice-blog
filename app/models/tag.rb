class Tag < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :tag, presence: true

  def to_s
    tag
  end

  def to_param
    tag
  end
end
