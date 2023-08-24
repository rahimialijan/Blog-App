class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_create :update_comment_counter

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
