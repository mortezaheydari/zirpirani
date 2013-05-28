class PostsController < ApplicationController

  before_filter :authenticate_account!

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "post created."
    else
      render new, alert: "There was a problem with creating the post."
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attribtes(params[:post])
      redirect_to @post, notice: "post created."
    else
      render edit, alert: "There was a problem with saving the post."
    end
  end

  def destroy
    @post = Post.find(params[:id])
  end

end
