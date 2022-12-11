class Article < ApplicationRecord
  #belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :articletags
  has_many :tags, through: :articletags
  has_many :likes, as: :likeable
  enum status: { draft: 0, published: 1 } , default: 0

  validates :title, :body, presence: true
  scope :all_articles, -> { order('created_at DESC') }


  def self.tags_query(tag_ids)
    if tag_ids.size == 1
      joins(:articletags).where('articletags.tag_id': tag_ids.first)
    else
      joins(:articletags).where('articletags.article_id': Articletag.select('articletags.article_id')
                                                                      .where(tag_id: tag_ids)
                                                                      .group('articletags.article_id')
                                                                      .having("COUNT(articletags.article_id) > #{tag_ids.size - 1}"))
                          .uniq
    end
  end
end
