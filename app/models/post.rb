class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_post_counter
    author.update(posts_counter: author.posts.count)
  end

  validates_presence_of :title

  validates_length_of :title, maximum: 250

  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
