class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
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
    Cat.all.select{|c| c.owner == self}
  end

  def dogs
    Dog.all.select{|d| d.owner == self}
  end

  def buy_cat(name)
    #Make a new instance of the appropriate pet, 
    #initializing it with that name and the
    #owner who is purchasing it.
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select{|d| d.mood = "happy"}
  end

  def feed_cats
    Cat.all.select{|c| c.mood = 'happy'}
  end

  def sell_pets
    Dog.all.select{|d| d.mood = "nervous"}
    Dog.all.select{|d| d.owner = nil}

    Cat.all.select{|c| c.mood = "nervous"}
    Cat.all.select{|c| c.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end