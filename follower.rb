require 'pry'

class Follower
  attr_reader :name, :age
  attr_accessor :life_motto

  @@all = []

  def initialize(name, age, life_motto = 'Undeclared')
    @name = name
    @age = age
    @life_motto = life_motto

    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def follower_blood_oaths
    BloodOath.all.select { |blood_oaths| blood_oaths.followers == self }
  end

  def cults
    follower_blood_oaths.map(&:cults).uniq
  end

  def my_cult_count
    cults.count
  end

  def join_cult(blood_oath_day, cult)
    if cult.minimum_age <= age
      BloodOath.new(blood_oath_day, cult, self)
    else
      BloodOath.to_young_message
    end
  end

  def found_cult(blood_oath_day, cult_name, cult_location)
    year_founded = blood_oath_day.split('-').first.to_i
    new_cult = Cult.new(cult_name, cult_location, year_founded)
    BloodOath.new(blood_oath_day, new_cult, self)
  end

  def self.of_a_certain_age(youngest_age)
    all.select { |cultist| cultist.age >= youngest_age }
  end

  def my_cults_slogans
    puts cults.map(&:slogan)
  end

  def self.most_active
    all.max_by(&:my_cult_count)
  end

  def self.top_ten
    all.max_by(10) { |follower| follower.my_cult_count }
  end

  def cult_members(cult)
    BloodOath.all.select { |blood_oath| blood_oath.cult == cult }
  end

  def fellow_cult_members
    fellow_cultists = cults.map(&:cult_followers).flatten.uniq
    fellow_cultists.delete_if { |follower| follower == self }
  end
end
