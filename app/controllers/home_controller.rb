class HomeController < ApplicationController
  include SessionsHelper

    before_filter :before_change, only: [:davari]


  def index
    @posts = Post.where("approved = 1").order("updated_at desc").page(params[:page]).per(20)
  end

  def post_page

  end

  def meme_info
    @memes = Meem.order("created_at desc").page(params[:page]).per(20)
  end

  def davari
    @posts = Post.where("approved = 0").order("created_at desc").page(params[:page]).per(20)
  end
end
