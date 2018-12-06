class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :time_sent, :user

  def time_sent
    object.created_at.to_time.in_time_zone.in_time_zone("Eastern Time (US & Canada)").strftime("%I:%M%p")
  end

  def user
    User.find(object.user_id).username
  end
end
