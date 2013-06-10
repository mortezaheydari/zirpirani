class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.page(params[:page]).per(10)
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_posts = @user.favorite_posts.page(params[:page]).per(10)
  end

  def list
  	@users = User.all
  end

  def remove_admin
	user = User.find(params[:id])
  	remove_admin user unless user.nil?
  	redirect_to users_list_path, success: "administration removed from #{user.name}"
  end

  def add_admin
	user = User.find(params[:id])
  	add_admin user unless user.nil?
  	redirect_to users_list_path, success: "administration added from #{user.name}"
  end
end
