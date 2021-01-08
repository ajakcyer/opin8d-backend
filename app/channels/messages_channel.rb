class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    byebug
    stop_all_streams
    conversation = Conversation.find(params[:id])
    stream_for conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
