class SessionsController < Devise::SessionsController
    before_filter :blocked_users_sign_in, :only => [ :create ]
  # POST /resource/sign_in
  def create
    # self.resource = warden.authenticate!(auth_options)

    if self.resource.user.has_role? :blocked
		redirect_to new_account_registration_path, alert: "your account is suspended."
    else
	    set_flash_message(:notice, :signed_in) if is_navigational_format?
	    sign_in(resource_name, resource)
	    respond_with resource, :location => after_sign_in_path_for(resource)
	end
  end

end