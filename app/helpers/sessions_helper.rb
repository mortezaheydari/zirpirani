module SessionsHelper

	def toggle_favorite_button(this, user)
		if user.flagged?(this, :favorite)
			link_to content_tag("div", "<div class=\"icon\"></div><p class=\"hide-for-small\">Favorite</p>".html_safe, class: "three mobile-one columns fav_active"), send("favorite_#{this.class.to_s.downcase}_path"), remote: true
		else
			link_to content_tag("div", "<div class=\"icon\"></div><p class=\"hide-for-small\">Favorite</p>".html_safe, class: "three mobile-one columns favourite"), send("favorite_#{this.class.to_s.downcase}_path"), remote: true
		end
	end

	def toggle_favorite_card_button(this, user, options = {})
		if user.flagged?(this, :favorite)
			thumbs ="fav_active"
		else
			thumbs ="fav"
		end
		link_to content_tag("div", "", class: thumbs), send("favorite_cards_#{this.class.to_s.downcase}_path", id: this.id, card_type: options[:card_type]), remote: true, class: options[:class_name]
	end

	def current_user?(user)
		user == current_user
	end

	private
		def current_user=(user)
			@current_user = user
		end

		def current_user
			@current_user ||= current_account.user
		end

end
