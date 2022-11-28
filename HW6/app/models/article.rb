class Article < ApplicationRecord
  #belongs_to :author
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true

end
