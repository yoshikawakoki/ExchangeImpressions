class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.user_id = current_user.id
    @post_comment_post = @post_comment.post
    if @post_comment.save
      #通知
      @post.create_notification_post_comment!(current_user, @post_comment.id)
    else
      #comments/error.js.erbを呼び出す
      render "error"
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
