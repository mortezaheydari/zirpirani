class UsersController < ApplicationController
  include SessionsHelper, UsersHelper

    before_filter :current_user_is_super_admin?, only: [:list, :remove_admin, :add_admin]

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
	@user = User.find(params[:id])
  	kick_admin(@user) unless @user.nil?
  	redirect_to list_path, success: "administration removed from #{user.name}"
  end

  def add_admin
	@user = User.find(params[:id])
  	make_admin(@user) unless @user.nil?
  	redirect_to list_path, success: "administration added to #{@user.name}"
  end
end
