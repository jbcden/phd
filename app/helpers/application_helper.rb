module ApplicationHelper

  #Produces a title for each page.
  def title(page_title)
    base = "PHD"
    if page_title.empty?
      base
    else
      "#{base} | #{page_title}"
    end
  end
  
  def signed_out # an attempt to remove the cookies of an expired session.
		if self.current_user.nil?
			cookies.delete(:remember_token)
		end
	end	

  def broadcast(channel, &block)
    message = { channel: channel, data: capture(&block), ext: {auth_token: FAYE_TOKEN} }
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, message: message.to_json)	
  end
end
