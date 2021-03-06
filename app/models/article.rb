class Article < ActiveRecord::Base
  # Validate specific fields passed to the article model
  has_many :comments, dependent: :destroy
  validates :author, :title, :text, presence: true,
            length: { minimum: 5 }
end
