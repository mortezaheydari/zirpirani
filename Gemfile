source 'https://rubygems.org'

gem 'rails', '3.2.9'

gem 'sqlite3'
gem 'jquery-rails'
gem "paperclip", "~> 3.0"
gem 'sunspot_rails'
gem "cancan", ">= 1.6.8"
gem "rolify",        :git => "git://github.com/EppO/rolify.git"
gem "simple_form", ">= 2.0.4"
gem 'make_flaggable', :git => 'git://github.com/cavneb/make_flaggable.git'
gem 'recaptcha', :require => 'recaptcha/rails'
gem 'faker', '1.0.1'
gem "factory_girl_rails", ">= 4.1.0", :group => [:development, :test]
gem 'nifty-generators'
gem 'kaminari'

# Rails – Twitter and Facebook Authentications with Omniauth and Devise
# Source:	http://www.orhancanceylan.com/rails-twitter-and-facebook-authentications-with-omniauth-and-devise/
	gem "devise", ">= 2.1.2"
	gem 'omniauth-twitter'
	gem 'omniauth-facebook'
	gem 'twitter'
	gem 'fb_graph'
        gem 'bourbon'
#

# Gems used only for assets and not required
# in production environments by default.
group :assets do
	gem 'sass-rails',   '~> 3.2.3'
	gem 'coffee-rails', '~> 3.2.1'

	gem 'uglifier', '1.2.3'
           gem 'zurb-foundation', '~> 4.0.0'
end

group :development do
	gem 'sunspot_solr'
end

group :test do
	gem "capybara", ">= 2.0.1"
	gem "email_spec", ">= 1.4.0"
	gem "database_cleaner", ">= 0.9.1"
	gem "mocha"
end

group :production do
	# gem 'pg', '0.12.2'
	gem 'sunspot_solr'
end
