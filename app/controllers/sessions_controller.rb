#encoding: utf-8
class SessionsController < ApplicationController

	skip_before_filter :require_login, :only => [:new, :create, :failure]

	def new
	end

	def create
		@user_hash = request.env["omniauth.auth"]

		if @user_hash.extra.raw_info.company == "Zmartgroup"
			redirect_to root_path, :notice => "You must be part of Zmartgroup!"
    elsif @user = User.where(github_uid: @user_hash.uid).first
    	save_user_data(@user, @user_hash)
    	auto_login(@user)
    	redirect_to root_path, :notice => "Logged in!"
    else
      begin
        @user = User.new()
        save_user_data(@user, @user_hash)
        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, :notice => "Logged in!"
      rescue
        redirect_to root_path, :notice => "Failed to login!"
      end
    end
	end

  def failure
  	render :text => "FAILURE :-("
  end

	def destroy
	  logout
	  redirect_to root_url
	end

	protected
		def save_user_data(user, hash)
			user.name = hash.info.name
			user.email = hash.info.email
			user.github_uid = hash.uid
			user.github_token = hash.credentials.token
			user.avatar = hash.extra.raw_info.avatar_url
			user.save
    end
end
