#encoding: utf-8
class SessionsController < ApplicationController

	skip_before_filter :require_login, :only => [:new, :create, :failure]

	def new
	end

	def create
		render :text => "<pre>"+request.env["omniauth.auth"].to_yaml+"</pre>"
		@user_hash = request.env["omniauth.auth"]

		if @user_hash.extra.raw_info.company == "Zmartgroup"
			redirect_to root_path, :notice => "You must be part of Zmartgroup!"
    elsif @user = User.where(github_uid: @user_hash.uid).first
    	auto_login(@user)
    	redirect_to root_path, :notice => "Logged in!"
    else
      begin
        @user = User.new()
        @user.name = @user_hash.info.name
        @user.email = @user_hash.info.email
        @user.github_uid = @user_hash.uid
        @user.github_token = @user_hash.credentials.token
        @user.avatar = @user_hash.info.image
        @user.save(:validate => false)

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
end
