class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper	#holds all methods concerning sessions: TODO: find a better place to keep these methods.
end