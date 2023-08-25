require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John', post_counter: 0)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil, post_counter: 0)
    expect(user).to_not be_valid
  end

  it 'is not valid with a negative post_counter' do
    user = User.new(name: 'Jane', post_counter: -1)
    expect(user).to_not be_valid
  end

  it 'is valid with a positive post_counter' do
    user = User.new(name: 'Alice', post_counter: 5)
    expect(user).to be_valid
  end

  describe '#recent_posts' do
    it 'returns all posts if the limit is greater than total posts' do
      user = User.create(name: 'Eve', post_counter: 0)
      user.posts.create(title: 'Post 1', text: 'This is post 1.')
      user.posts.create(title: 'Post 2', text: 'This is post 2.')

      recent_posts = user.recent_posts(10)
      expect(recent_posts).to eq(user.posts.order(created_at: :desc).limit(10))
    end
  end
end
