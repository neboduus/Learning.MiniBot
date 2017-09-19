class WebhooksController < ApplicationController
  def callback
    !webhook[:message][:from].nil? ?  MessageDispatcher.new(webhook, user).process : nil
    ap webhook
    render json: nil, status: :ok
  end

  def user
    @user = User.find_by(telegram_id: from[:id])
    @user == nil ? @user = User.new(telegram_id: from[:id], name: first_name, state: {:status => 0, :data => {}}.to_json) : @user
  end

  def webhook
    params['webhook']
  end

  def from
    webhook[:message][:from]
  end

  def name
    from[:first_name]
  end

  def user_id
    webhook[:user_id]
  end

end
