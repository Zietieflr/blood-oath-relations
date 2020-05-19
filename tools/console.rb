require_relative '../config/environment.rb'

require_relative '../cult.rb'
require_relative '../follower.rb'
require_relative '../blood_oath.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# cult - name, location, founding_year, slogan(optional)
# followers - name, age, life_motto(optional)
# blood oath - blood_oath_day (YYYY-MM-DD), cult, follower

reckoners = Cult.new('The Reckoners', 'Newcago', 2120)
interlopers = Cult.new('Interlopers', 'Maine', 1962)
golden_girls = Cult.new('The Church of Golden Girls', 'Florida', 1984)

anton = Follower.new('Anton Coyote', 44)
prudence = Follower.new('Prudence McDonald', 19)
planchette = Follower.new('Planchette Oyugi', 33)
keeper = Follower.new('Keeper Southland', 57)

BloodOath.new('2019-12-20', interlopers, anton)
BloodOath.new('1999-04-30', golden_girls, anton)
BloodOath.new('2002-05-04', interlopers, prudence)
BloodOath.new('2010-07-26', interlopers, planchette)
BloodOath.new('2011-09-24', golden_girls, keeper)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
