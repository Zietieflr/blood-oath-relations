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

  def string_date_to_number
    # Takes date removes '-' with split then returns date as integer
    blood_oath_day.split('-').join('').to_i
  end

  def self.first_oath
    all.min_by(&:string_date_to_number)
  end

  def self.to_young_message
    'Unfortunately, this cult has adult ' \
    'themes we are not sure you are ready for. ' \
    "\nPlease try again when you come of age and " \
    'your mind is less maliable to eldritch horror!'
  end
end
