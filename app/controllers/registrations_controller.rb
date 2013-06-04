  class RegistrationsController < Devise::RegistrationsController

# https://github.com/plataformatec/devise/wiki/How-To:-Use-Recaptcha-with-Devise
# https://www.google.com/recaptcha/admin/create

    def create
      if session[:omniauth] == nil #OmniAuth
        if verify_recaptcha
          super
          session[:omniauth] = nil unless @user.new_record? #OmniAuth
        else
          build_resource
          clean_up_passwords(resource)
          flash[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
          #use render :new for 2.x version of devise
          render_with_scope :new 
        end
      else
        super
        session[:omniauth] = nil unless @user.new_record? #OmniAuth
      end
    end


    def build_resource(*args)
      super
      if session[:omniauth]
        @account.apply_omniauth(session[:omniauth])
        @account.valid?
      end
    end

  end