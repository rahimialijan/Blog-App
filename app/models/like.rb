class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_create :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
