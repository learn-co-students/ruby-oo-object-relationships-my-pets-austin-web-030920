class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    all_pets = dogs.concat(cats)
    all_pets.each {|pet| pet.mood = "nervous"}
    all_pets.each {|pet| pet.owner = nil}
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

  end