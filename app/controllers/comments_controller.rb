class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = @post.comment.create(comment_params)
    redirect_to user_post_path(@user, @post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
