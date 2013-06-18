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

    redirect_to root_path unless current_user_is_super_admin?
  end

  def remove_admin
	@user = User.find(params[:id])
            if current_user.has_role?(:super_admin) && !@user.nil?
              @user.remove_role :admin
              redirect_to list_path, success: "administration removed from #{@user.name}"
            else
              redirect_to list_path, alert: "administration error: #{@user.name}"
            end
  end

  def add_admin
	@user = User.find(params[:id])
            if current_user.has_role?(:super_admin) && !@user.nil?
              @user.add_role :admin
              redirect_to list_path, success: "administration added to #{@user.name}"
            else
              redirect_to list_path, alert: "administration error: #{@user.name}"
            end
  end

  def block
    @user = User.find(params[:id])
            if current_user.has_role?(:super_admin) && !@user.nil?
              @user.add_role :blocked
              redirect_to list_path, success: "#{@user.name} blocked"
            else
              redirect_to list_path, alert: "error blocking #{@user.name}"
            end
  end

  def unblock
    @user = User.find(params[:id])
            if current_user.has_role?(:super_admin) && !@user.nil?
              @user.remove_role :blocked
              redirect_to list_path, success: "#{@user.name} unblock"
            else
              redirect_to list_path, alert: "error unblocking #{@user.name}"
            end
  end

  private

    def current_user_is_super_admin?
        !current_user.nil? && current_user.has_role?(:super_admin)
    end


end
