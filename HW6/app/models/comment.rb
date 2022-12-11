class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article
  enum status: { unpublished: 0, published: 1 }

  validates :author, :article, presence: true
  validates :body, presence: true, length: { minimum: 5, message: 'Comment must contain 5 characters at least' }
  scope :all_comments, -> { order('created_at DESC') }
end
