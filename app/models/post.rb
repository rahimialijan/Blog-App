class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(create_at: :desc).limit(limit)
  end
end
