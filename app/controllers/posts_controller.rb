class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @post =Post.new(post_params)
    @post.save
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

  private
  def post_params
    params.require(:post).permit(:image, :body, :evaluation, :hashtag_id)
  end
end
