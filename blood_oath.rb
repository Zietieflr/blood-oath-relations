require 'pry'

class BloodOath
  attr_reader :blood_oath_day, :cults, :followers

  @@all = []
  def initialize(blood_oath_day, cult, follower)
    @blood_oath_day = blood_oath_day
    @cults = cult
    @followers = follower

    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.followers
    all.map(&:followers)
  end

  def self.cults
    all.map(&:cults)
  end
end