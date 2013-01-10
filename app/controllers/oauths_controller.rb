class OauthsController < ApplicationController
  skip_before_filter :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @provider = Config.send(provider)
        @user_hash = @provider.get_user_hash

        @user = User.new()
        @user.name = @user_hash[:user_info]["name"]
        @user.email = @user_hash[:user_info]["email"]
        @user.github_uid = @user_hash[:uid]
        @user.save(:validate => false)

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :notice => "Failed to login from #{provider.titleize}!"
      end
    end
  end
end