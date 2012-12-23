class MessagesController < ApplicationController
  def index
  	@messages = Message.chat_hist
  end

  def create
  	@message = Message.create!(params[:message])
  end
end
