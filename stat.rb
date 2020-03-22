# класс Станция
class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_trains(train)
    @trains << train
  end

  def dep_trains(train)
    @trains.delete(train)
  end
  
end

# класс Маршрут
class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def add_station(station) # добавление промежуточной станции
    stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station)
  end

end

# класс Поезд
class Train
  attr_reader :type, :wagons, :route

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def current_speed
    @speed
  end

  def increase_speed(power) # увеличение скорости
    if @speed + power < 0
      @speed = 0
    else
      @speed += power
    end
  end

  def decrease_speed(power) # снижение скорости
    if @speed - power < 0
      @speed = 0
    else
      @speed -= power
    end
  end

  def add_wagon # добавление вагона
    @wagons += 1 if @speed == 0
  end

  def remove_wagon # отцепление вагона, если скорость равна 0 и количество больше 0
    @wagons -= 1 if @speed == 0 and @wagons > 0
  end

  def route=(route)
    @route = route
    @current_station_index = 0
  end

  def current_stations
    route.stations[@current_station_index]
  end

  def next_stations
    route.stations[@current_station_index + 1]
  end

  def previous_stations
    route.stations[@current_station_index - 1]
  end

  def go_forward
    self.current_station_index += 1
  end

  def go_backward
    self.current_station_index -= 1
  end

end
