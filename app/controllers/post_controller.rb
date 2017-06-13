class PostController < ApplicationController
  before_action :authenticate_request!
  def create
    pars = post_params
    pars[:author] = @current_user.firstname + " " + @current_user.lastname
    post = Post.new(pars)
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
      render json: { result: Post.find(params[:id])}
    end
  end

  def index
    posts = Post.where(user_id: @current_user.id).page(params[:page])
    render json: { posts: posts, total_pages: posts.total_pages }
  end

  def update
    if !Post.exists?(params[:id])
      render json: {error:"We couldn't find your post"}
    else
      post = Post.find(params[:id])
      if post.update_attributes(post_params)
        render json: {result:"Post updated successfully"}
      else
        render json: {error:"Could not update your Post"}
      end
    end
  end

  def destroy
    if !Post.exists?(params[:id])
      render json: {error:"Post not found"}
    else
      post = Post.find(params[:id])
      post.destroy
      render json: {result:"Post deleted"}
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
