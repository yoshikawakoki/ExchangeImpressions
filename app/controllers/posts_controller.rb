class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
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
    if @post.evaluation == nil
      @post.evaluation = 0
    end
    @post.save
    #if params[:post][:hashname] != nil
    redirect_to post_path(@post.id)
  end

  def hashtag
    @hashtag = Hashtag.find_by(hashname: params[:name])
    @posts = @hashtag.posts
    @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
  end

  private
  def post_params
    params.require(:post).permit(:place, :body, :user_id, :evaluation, :hashbody, hashtag_ids: [], post_images_images: [])
  end
end
