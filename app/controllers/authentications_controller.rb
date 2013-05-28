class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to authentications_url, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end


  def twitter
    raise omni = request.env["omniauth.auth"].to_yaml
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect Account.find(authentication.accont_id)

    elsif current_account
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret

      current_account.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_account
    else
      account = Account.new
      account.email = omni['info']['email']
      account.build_user(name: omni['info']['nickname'])
      account.apply_omniauth(omni)

      if account.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect Account.find(account.id)
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_account_registration_path
      end
    end
  end

  def facebook
    # raise omni = request.env["omniauth.auth"].to_yaml
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication

      flash[:notice] = "Logged in Successfully"

      sign_in_and_redirect Account.find(authentication.account.id)


    elsif current_account
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret

      current_account.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_account
    else
      account = Account.new
      account.email = omni['info']['email']
      account.build_user(name: omni['info']['nickname'])
      # user.name = omni['info']['nickname']

      account.apply_omniauth(omni)
      if account.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect Account.find(account.id)
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_account_registration_path
      end
    end
  end
end
