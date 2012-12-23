class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper	#holds all methods concerning sessions: TODO: find a better place to keep these methods.
end
=begin
unless  ActionController::Base.config.consider_all_requests_local
  rescue_from Exception, :with => :render_404
  rescue_from Exception, :with => :render_500
end

private

  def render_404
    render :template => '../../public/404.html', :layout => false, :status => :not_found
  end

  def render_500
    render :template => '../../public/500.html', :layout => false, :status => 500
  end


end
=end