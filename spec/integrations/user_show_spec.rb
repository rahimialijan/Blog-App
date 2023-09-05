require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Doraemon & Nobita', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Best friends', posts_counter: 12)

    # Create one post for the user
    @post = Post.create(title: 'Physics', text: 'This is not my first post', comments_counter: 10, likes_counter: 10,
                        author: @user)

    # Create two more posts for the user
    2.times do |n|
      Post.create(
        author_id: @user.id,
        title: "Post Title #{n + 2}",
        text: "Post Text #{n + 2}",
        comments_counter: 0,
        likes_counter: 0
      )
    end
  end

  describe 'User show page' do
    before(:each) { visit user_path(id: @user.id) }

    it 'displays a container for the users' do
      expect(page).to have_css('section.container')
    end

    it "displays the user's profile picture" do
      expect(page).to have_xpath("//img[@src = '#{@user.photo}' ]")
    end

    it "displays the user's username" do
      expect(page).to have_content(@user.name)
      expect(page).to have_link(@user.name, href: user_path(id: @user.id))
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 3') # Three posts in total
    end

    it "shows the user's bio" do
      expect(page).to have_content('Bio')
      expect(page).to have_content(@user.bio)
    end

    it 'has a button to view all user posts' do
      expect(page).to have_link('See all Posts', href: user_posts_path(user_id: @user.id))
    end

    it 'redirects to open all posts of a user' do
      click_link('See all Posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end

    it 'shows the first 3 posts of the user' do
      visit user_path(id: @user.id)
      within('.recent-post.user-posts') do
        @user.recent_posts.first(3).each do |post|
          expect(page).to have_content("Post # #{post.user_post_sequence}")
          expect(page).to have_content(post.text)
        end
      end
    end
  end
end
