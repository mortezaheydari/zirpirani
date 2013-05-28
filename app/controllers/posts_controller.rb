class PostsController < ApplicationController
  include SessionsHelper
  before_filter :authenticate_account!

  def show
    @post = Post.find(params[:id]).page(params[:page]).per(20)
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

  def smiley_face
    @post = Post.find(params[:id])
    current_user.toggle_flag(@post, :favorite)

    respond_to do |format|
        format.js { render 'posts/smiley_face.js.erb', :locals => { post: @post } }
    end
  end

end
