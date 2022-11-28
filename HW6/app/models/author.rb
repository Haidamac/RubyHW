class Author < ApplicationRecord
  #has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy #, through: :articles
  validates :name, presence: { message: "Must be given please" }, uniqueness: { message: "This name already taken" }
end
