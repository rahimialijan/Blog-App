class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_comment_counter
    posts.update(comments_counter: post.comments.count)
  end
end
