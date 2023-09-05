require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'User1') }
  let(:post) { Post.create(author: user, title: 'My Post', text: 'Sample text') }

  it 'is valid with valid attributes' do
    like = Like.new(post:, author: user)
    expect(like).to be_valid
  end

  it 'is not valid without an author' do
    like = Like.new(post:)
    expect(like).to_not be_valid
  end

  it 'is not valid without a post' do
    like = Like.new(author: user)
    expect(like).to_not be_valid
  end

  require 'rails_helper'

  describe '#update_likes_counter' do
    it 'increments the post likes_counter by 1' do
      user = User.create!(name: 'User Name', posts_counter: 0)
      post = Post.create!(author: user, title: 'Post Title', comments_counter: 0, likes_counter: 0)
      like = Like.new(author: user, post:)

      expect(post.likes_counter).to eq 0

      like.save!
      post.reload

      expect(post.likes_counter).to eq 1
    end
  end
end
