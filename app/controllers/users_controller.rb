class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.page(params[:page]).per(10)
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_posts = @user.favorite_posts.page(params[:page]).per(10)
  end
end
