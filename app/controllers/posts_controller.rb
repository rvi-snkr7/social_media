class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    if !@post
      redirect_to show_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end