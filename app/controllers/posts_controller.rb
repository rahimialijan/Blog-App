class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = User.includes(posts: [:author]).find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_post_path(@user.id, @post.id), notice: 'Post was successfully created'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post # Check authorization
    if @post.destroy
      redirect_to user_posts_path(current_user), notice: 'Post was successfully deleted.'
    else
      redirect_to user_posts_path(current_user), alert: 'Unable to delete the post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
