class GroupChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'group_channel'
    User.add
    ActionCable.server.broadcast('group_channel', type: "update count", count: User.online)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    User.nono
  end

  def speak(data)
    if data['message'].length >= 1
      user = User.find_or_create_by(username: data['user'])
      message = Message.create(content: data['message'])
      user.messages << message
      ActionCable.server.broadcast('group_channel', count: User.online, user: user.username, content: message.content, time_sent: message.time_sent)

end
end
end
