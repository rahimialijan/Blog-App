class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  validates_presence_of :name

  validates:post_counter, numericality: {only_integer:true, greater_than_or_equal_to:0}

  def recent_post
    posts.order(create_at: :desc).limit(3)
  end
end
