module SessionsHelper

	#TODO fix cookie expiration.
	def sign_in(user)
		cookies[:remember_token] = { value: user.remember_token,
								    expires: 1.minutes.from_now }
		self.current_user=user
	end	
  
  def current_user=(user) # an assignment function
		@current_user = user
	end
	
	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end	
	
	def signed_in?
		!current_user.nil?
	end	
	
	def sign_out
   	 	self.current_user = nil
    	cookies.delete(:remember_token)
  end
	
	def signed_in_user # TODO: may use this in a before_filter later
		unless signed_in?
			store_location
			redirect_to root_path, notice: "Please sign in."
		end
	end
	def store_location
		session[:return_to] = request.fullpath
	end
end
