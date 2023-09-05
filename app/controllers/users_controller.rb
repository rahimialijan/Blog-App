class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @recent_posts = @user.recent_posts
  end
end
