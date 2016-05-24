# car class which all cars inherit
class Car
  # Purpose: create car with 4 wheels and model year
  # Signature: String -> (nothing)
  # Examples: Car.new('2013') -> {@wheels = 4, @year = '2013'}
  def initialize(year)
    @wheels = 4
    @year = year
    @lights_on = false
    @speed = 0
    @speed_unit = 'km/h'
  end

  def model
    self.class.to_s
  end

  # Purpose: return number of wheels
  # Signature: (nothing) -> integer
  # Examples: my_car.wheels -> 4
  def wheels
    @wheels
  end

  # Purpose: return model year
  # Signature: (nothing) -> String
  # Examples: my_car.year -> '2013'
  def year
    @year
  end

  # Purpose: toggle between lights on and off
  # Signature: (nothing) ->  nothing
  # Examples: lights_on == true -> 'on'
  def toggle_lights
    @lights_on = @lights_on == false
  end

  # Purpose: status of lights
  # Signature: (nothing) -> True/False
  # Examples: (@lights_on == True) my_car.lights_on -> True
  def lights_on
    @lights_on
  end

  # Purpose: increase @speed by a variable amount
  # Signature: Fixednum/Float ->
  def speed_up_car(increase_speed)
    @speed += increase_speed
  end

  def speed
    @speed.to_s + ' ' + @speed_unit
  end

  def slow_down_car(decrease_speed)
    if @speed < decrease_speed
      @speed = 0
    else
      @speed -= decrease_speed
    end
  end
end

# car subclass goes faster than other cars
class Tesla < Car
  # Purpose: increase @speed for specific Car
  # Signature: (nothing) ->  nothing
  # Examples: (@speed = 0) my_car.accelerate (@speed = 10)
  def accelerate
    speed_up_car(10)
  end

  # Purpose: decrease @speed for specific Car
  # Signature: (nothing) ->  nothing
  # Examples: (@speed = 10) my_car.brake (@speed = 3)
  def brake
    slow_down_car(7)
  end
end

# car subclass goes slower than other cars
class Tatas < Car
  # Purpose: increase @speed for specific Car
  # Signature: (nothing) ->  nothing
  # Examples: (@speed = 0) my_car.accelerate (@speed = 10)
  def accelerate
    speed_up_car(2)
  end

  # Purpose: decrease @speed for specific Car
  # Signature: (nothing) ->  nothing
  # Examples: (@speed = 10) my_car.brake (@speed = 3)
  def brake
    slow_down_car(1.25)
  end
end

# car subclass goes average speed
class Toyota < Car
  # Purpose: increase @speed for specific Car
  # Signature: (nothing) ->  nothing
  # Examples: (@speed = 0) my_car.accelerate (@speed = 10)
  def accelerate
    speed_up_car(7)
  end

  # Purpose: decrease @speed for specific Car
  # Signature: (nothing) ->  nothing
  # Examples: (@speed = 10) my_car.brake (@speed = 3)
  def brake
    slow_down_car(5)
  end
end

# class to store multiple car objects in
class Collection
  def initialize
    @car_collection = []
  end

  def add_car(new_car)
    @car_collection << new_car
  end

  def see_collection
    @car_collection.map { |car| car.model + ' ' + car.year }
  end

  def see_other_collection
    @car_collection
  end

  def sort_by_year
    @car_collection = @car_collection.sort { |car1, car2| car1.year <=> car2.year}
  end

  # Purpose:
  # Signature (nutin') -> Array of Cars
  # Examples:
  # sort_by_model() -> []
  # sort_by_model() -> [<Car; Alpha>, <Car; Tata>]
  def sort_by_model
    @car_collection = @car_collection.sort { |car1, car2| car1.model <=> car2.model }
  end

  def sort_by_model_and_year
    @car_collection = @car_collection.sort { |car1, car2| car1.model + car1.year <=> car2.model + car2.year }
  end
end

my_collection = Collection.new
my_collection.add_car(Tesla.new('2020'))
my_collection.add_car(Tesla.new('2016'))
my_collection.add_car(Tatas.new('2000'))
my_collection.add_car(Tatas.new('1970'))
my_collection.add_car(Toyota.new('1987'))
my_collection.add_car(Toyota.new('2004'))

my_collection.sort_by_year
puts my_collection.see_collection

p "hello"
puts "hello"
# puts my_collection.sort_by_year

# my_toyota = Toyota.new('1999')
# puts my_toyota.wheels
# puts my_toyota.year
# puts my_car.lights_on
# my_car.toggle_lights
# puts my_car.lights_on
# my_car.toggle_lights
# puts my_car.lights_on

# my_tesla = Tesla.new('2016')
# puts my_tesla.speed
# my_tesla.accelerate
# puts my_tesla.speed
# my_tesla.brake
# puts my_tesla.speed
# puts my_tesla.model

# my_tatas = Tatas.new('1985')
# puts my_tatas.speed
# my_tatas.accelerate
# puts my_tatas.speed
# my_tatas.brake
# puts my_tatas.speed
# my_tatas.brake
# puts my_tatas.speed
