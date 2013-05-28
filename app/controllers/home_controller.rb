class HomeController < ApplicationController
  def index
    @posts = Post.order("created_at desc").page(params[:page]).per(20)
  end

  def post_page

  end

  def meme_info

  end
end
