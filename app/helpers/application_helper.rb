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
end
