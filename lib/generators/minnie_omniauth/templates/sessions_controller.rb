class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:create]

  def create
    @user = User.authenticate(auth_hash)
    sign_in_and_redirect(@user) 
  end

  def destroy  
    sign_out_and_redirect
  end   

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
