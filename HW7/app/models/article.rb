class Article < ApplicationRecord
  #belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :articletags
  has_many :tags, through: :articletags
  has_many :likes, as: :likeable

  validates :title, :body, presence: true
  scope :all_articles, -> { order('created_at DESC') }

end
