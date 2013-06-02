  class RegistrationsController < Devise::RegistrationsController

# tbd 20130429 - Captcha for devise
# to be uncommented when website goes online
# https://github.com/plataformatec/devise/wiki/How-To:-Use-Recaptcha-with-Devise
# https://www.google.com/recaptcha/admin/create

=begin
    def create
      if verify_recaptcha
        super
      else
        build_resource
        clean_up_passwords(resource)
        flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."      
        flash.delete :recaptcha_error
        render :new
      end
    end

=end
    def create

      super

      session[:omniauth] = nil unless @account.new_record?

    end

    def build_resource(*args)
      super
      if session[:omniauth]
        @account.apply_omniauth(session[:omniauth])
        @account.valid?
      end
    end

  end