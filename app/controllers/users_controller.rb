class UsersController < ApplicationController
  def index
    @users = User.includes(:posts).all.order(id: :asc)
  end

  def show
    @users = User.find(params[:id])
    @recent_posts = @users.recent_posts
  end
end
