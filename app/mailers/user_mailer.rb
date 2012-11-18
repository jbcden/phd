class UserMailer < ActionMailer::Base
  default from: "The Pie-Hole Dialogues <phdialogues@gmail.com>"
  
  def greetings_email(user)
  	@user = user
  	@url = "http://localhost:3000"
  	mail(:to => user.email, :subject => "Welcome to the Pie-Hole Dialogues!")
  end
end
