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
    follower_blood_oaths.map(&:cults)
  end

  def my_cult_count
    cults.count
  end

  def join_cult(blood_oath_day, cult)
    BloodOath.new(blood_oath_day, cult, self)
  end

  def found_cult(blood_oath_day, cult_name, cult_location)
    new_cult = Cult.new(cult_name, cult_location, blood_oath_day.split('-').first.to_i)
    BloodOath.new(blood_oath_day, new_cult, self)
    new_cult
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
end
