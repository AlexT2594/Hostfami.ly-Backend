class PostController < ApplicationController
  before_action :authenticate_request!
  def create
    post = Post.new(post_params)
    @current_user.posts << post
    post.user = @current_user
    if post.save
      render json: { result: "Successful" }
    else
      render json: { error: "Something" }
    end
  end

  def show
    post = Post.exists?(params[:id])
    if !post
      render json: { error: "Post not found" }
    else
      render json: { result: Post.find(params[:id]) }
    end
  end

  def index
    posts = Post.where(user_id: @current_user.id).page(params[:page]).order('created_at DESC')
    render json: { posts: posts, remaining_pages: posts.total_pages }
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
