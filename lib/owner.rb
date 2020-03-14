require 'pry'
class Owner
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|c| c.owner == self}
  end

  def dogs
    Dog.all.select {|d| d.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)

  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
    self.dogs.each do |dog| 
      dog.mood = "nervous"  
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end