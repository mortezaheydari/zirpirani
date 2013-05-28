class HomeController < ApplicationController
  def index
    @posts = Post.order("created_at desc")
  end

  def post_page

  end

  def meme_info

  end
end
