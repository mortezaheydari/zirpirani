class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.page(params[:page]).per(20)
  	@favorite_posts = @user.favorite_posts.page(params[:page]).per(20)
  end
end
