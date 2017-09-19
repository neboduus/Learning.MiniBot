require 'telegram/bot'
require 'chatscript'

class MessageDispatcher
  attr_reader :webhook, :user, :state

  def initialize(webhook, user)
    @webhook = webhook
    @user = user
    @state = JSON.parse(@user.state)
  end

  def process
    if @state[:state] == 0
      @state[:state] = 1
      @user.set_state(@state)
    else

    end
  end

  def message_text
    @webhook[:message][:text]
  end

end