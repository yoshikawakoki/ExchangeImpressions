class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update
    redirect_to post_path(@post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post =Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

  private
  def post_params
    params.require(:post).permit(:body, :user_id, hashtag_ids: [], images: [])
  end
end
