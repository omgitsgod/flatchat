class GroupChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if data["message"].length >= 1
      user = User.find_or_create_by(username: data["user"])
      message = Message.create(content: data["message"])
      user.messages << message
      ActionCable.server.broadcast('group_channel', {user: user.username, content: message.content, time_sent: message.time_sent})
    end
  end
end
