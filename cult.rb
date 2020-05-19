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

  def recruit_fresh_follower(blood_oath_day, follower_name, follower_age)
    new_follower = Follower.new(follower_name, follower_age)
    BloodOath.new(blood_oath_day, self, new_follower)
    new_follower
  end

  def recruit_follower(blood_oath_day, follower)
    BloodOath.new(blood_oath_day, self, follower)
  end

  def cult_population
    BloodOath.cults.select { |cult| cult == self }.count
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
end
