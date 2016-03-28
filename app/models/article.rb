class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :article_authors
  has_many :authors, through: :article_authors

  has_many :article_tags
  has_many :tags, through: :article_tags
end
