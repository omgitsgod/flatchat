class User < ApplicationRecord
  has_many :messages
  @@online = 0

  def self.add
    @@online += 1
  end

  def self.nono
    @@online -= 1
  end

  def self.online
    @@online
  end
end
