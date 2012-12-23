class Message < ActiveRecord::Base
  attr_accessible :content

  scope :chat_hist, lambda { where("created_at >= ?", Time.zone.now-2.days) }

  validates :content, presence: true
end