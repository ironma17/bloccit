class Api::V1::PostsController < Api::V1::BaseController

  before_filter :authenticate_user, except: [:index, :show]
  before_filter :authorize_user, except: [:index, :show, :destroy, :update]

  def show
    post = Post.find(params[:id])
    render json: post, include: [:comments,:votes,:favorites], status: 200
  end

  def update
    post = Post.find(params[:id])
    if post.update_attributes(post_params) && post.user == @current_user
      post.save!
      render json: post, status: 200
    else
      render json: {error: "Post update failed", status: 400}, status: 400
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user == @current_user && post.destroy
      render json: {message: "Post destroyed", status: 200}, status: 200
    else
      render json: {error: "Post destroy failed", status: 400}, status: 400
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
