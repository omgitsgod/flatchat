class GroupChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if data["message"].length >= 1
      message = Message.create(content: data["message"])
      ActionCable.server.broadcast 'group_channel', message.content
    end
  end
end