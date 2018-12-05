class Message < ApplicationRecord
  def time_sent
    self.created_at.to_time.in_time_zone.in_time_zone("Eastern Time (US & Canada)").strftime("%I:%M%p")
    # self.created_at.strftime("%I:%M%p%z:-05:00")
  end
end
