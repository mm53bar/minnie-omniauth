class SessionsController < ApplicationController
  def create
    @user = User.authenticate(auth_hash)
    #@user = User.find_or_create_from_auth_hash(auth_hash)
    sign_in_and_redirect(@user) 
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end