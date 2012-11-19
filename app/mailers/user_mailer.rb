class UserMailer < ActionMailer::Base
  default from: "The Pie-Hole Dialogues <phdialogues@gmail.com>"
  
  # the default greeting to our new users that also sends them their new password.
  def greetings_email(user)
  	@user = user
  	@url = "http://localhost:3000"
  	mail(:to => user.email, :subject => "Welcome to the Pie-Hole Dialogues!")
  end
end
