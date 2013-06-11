class SocialFeedsController < ApplicationController
	def feed
	  # this will be the name of the feed displayed on the feed reader
	  @title = "Zirpirani"

	  # the news items
	  @featured_posts = Post.where("approved = 1").order("created_at desc")

	  # this will be our Feed's update timestamp
	  @updated = @featured_posts.first.updated_at unless @featured_posts.empty?

	  respond_to do |format|
	    format.atom { render :layout => false }

	    # we want the RSS feed to redirect permanently to the ATOM feed
	    format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
	  end
	end
end
