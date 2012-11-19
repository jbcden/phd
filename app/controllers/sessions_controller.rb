class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase) #find user by signin email: downcase as db version is lowercase.
		if user && user.authenticate(params[:session][:password])
		sign_in user #sessionsHelper method.
		redirect_to user
		else
			flash.now[:error] = "Invalid email/password pair."
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end