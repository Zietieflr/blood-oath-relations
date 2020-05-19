require 'pry'

class Cult
  @@all = []

  attr_reader :name, :location, :founding_year
  attr_accessor :slogan

  def initialize(name, location, founding_year, slogan = 'Undeclared')
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan

    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def cult_blood_oaths
    BloodOath.all.select { |ritual_components| ritual_components.cults == self }
  end

  def cult_followers
    cult_blood_oaths.map(&:followers)
  end

  def recruit_fresh_follower(blood_oath_day, follower_name, follower_age)
    new_follower = Follower.new(follower_name, follower_age)
    BloodOath.new(blood_oath_day, self, new_follower)
    new_follower
  end

  def recruit_follower(blood_oath_day, follower)
    BloodOath.new(blood_oath_day, self, follower)
  end

  def cult_population
    cult_followers.count
  end

  def self.find_by_name(cult_name)
    all.find { |cult| cult.name == cult_name }
  end

  def self.find_by_location(cult_location)
    all.find { |cult| cult.location == cult_location }
  end

  def self.find_by_founding_year(cult_year_founded)
    all.find { |cult| cult.founding_year == cult_year_founded }
  end

  def average_age
    cult_followers.sum(&:age) / cult_followers.count.to_f
  end

  def my_followers_mottos
    puts cult_followers.map(&:life_motto)
  end

  def self.least_popular
    all.min_by(&:cult_population)
  end

  def self.most_popular
    all.max_by(&:cult_population)
  end

  def self.cults_in_same_location
    location.find_all { |location| location == self.location }
  end

  def self.most_common_location
    locations = all.map(&:location)
    locations.max_by { |location| locations.count(location) }
  end
end
