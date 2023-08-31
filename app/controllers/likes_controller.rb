class LikesController < ApplicationController
    def create
        @user = User.find(params[:user_id]) 
        @post = Post.find(params[:post_id])
      @like = @post.likes.build(author: @user) # Use `current_user` directly
  
      respond_to do |format|
        if @like.save
          format.html do
            redirect_to user_post_path(@user, @post), notice: 'Like was successfully created.'
          end
        else
          format.html do
            redirect_to user_post_path(user_id: current_user.id, id: @post.id), alert: 'Failed to add like.'
          end
        end
      end
    end
  end
  