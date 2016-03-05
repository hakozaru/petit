class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = @post.comment.create(comment_params)

    if @comment.errors.any?
      @comment.errors.full_messages.each_with_index do |e, i|
        flash["error_#{i+1}"] = e
      end
    end

    redirect_to user_post_path(@user, @post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
