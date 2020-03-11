class Owner

  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    return "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    return Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    return Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = 'happy'}
  end

  def feed_cats
    cats.each { |cat| cat.mood = 'happy'}
  end

  def sell_pets
    dogs.each { |dog| 
    dog.mood = 'nervous';
    dog.owner = nil}

    cats.each { |cat|
    cat.mood = 'nervous';
    cat.owner = nil}
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end