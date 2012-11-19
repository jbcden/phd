class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
	if !signed_in? #test whether a user is signed in: if not redirect_to login
		#logger.debug "New post: #{@post.attributes.inspect}" example of debugging!
		flash[:error] = "Please sign in."
		redirect_to root_path
	end	
  end

  def new
  if signed_in?
  	redirect_to current_user
  	else
  	@user = User.new
  	end
  end
  
  def create
  	if signed_in?
  		redirect_to current_user
  	else
  		@user = User.new(params[:user])
  		pass = User.random_string(10) #this is so that the user doesn't get a "confirmation can't be blank" error.
  		@user.password = pass
  		@user.password_confirmation = pass
  		if @user.save
  			flash[:success] = "Please check your email for confirmation and your temporary password."
  			UserMailer.greetings_email(@user).deliver #a wonderful greeting via email to our new user.
  			redirect_to root_path
  		else 
  			render 'new'
  		end
  	end
  end
end
