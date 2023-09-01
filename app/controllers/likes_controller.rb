class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(author: @user)

    if @like.save
      flash[:notice] = 'Like was successfully created.'
    else
      flash[:alert] = 'Failed to add like.'
    end

    redirect_to user_post_path(@user, @post)
  end
end
