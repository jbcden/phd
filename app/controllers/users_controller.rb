class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  @user = User.new
  end
  
  def create
  	@user = User.new(params[:user])
  	pass = User.random_string(10) #this is so that the user doesn't get a "confirmation can't be blank" error.
  	@user.password = pass
  	@user.password_confirmation = pass
  	if @user.save
  	UserMailer.greetings_email(@user).deliver
  		flash[:success] = "Please check your email for confirmation and your temporary password."
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end
end
