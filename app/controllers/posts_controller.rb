class PostsController < ApplicationController
 
  def index
    @user = User.includes(:posts).find(params[:user_id])
    puts "Current User: #{current_user.name} (Role: #{current_user.role})"
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
    @user = current_user
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(@user), notice: 'Post was successfully deleted.'
  end


  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
