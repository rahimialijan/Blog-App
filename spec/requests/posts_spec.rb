require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET #show' do
    it 'returns a successful response' do
      user = User.create(id: 1, name: 'ali', posts_counter: 0)
      post = Post.create(id: 1, author_id: user.id, title: 'Test Post 1', text: 'test content', comments_counter: 0,
                         likes_counter: 0)
      get user_post_path(user, post)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      user = User.create(id: 1, name: 'ali', posts_counter: 0)
      post = Post.create(id: 1, author_id: user.id, title: 'Test Post 1', text: 'test content', comments_counter: 0,
                         likes_counter: 0)
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      user = User.create(id: 1, name: 'ali', posts_counter: 0)
      post = Post.create(id: 1, author_id: user.id, title: 'Test Post 1', text: 'test content', comments_counter: 0,
                         likes_counter: 0)
      get user_post_path(user, post)
      expect(response.body).to include('Post Details')
    end
  end
end
