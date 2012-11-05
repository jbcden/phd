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
end
