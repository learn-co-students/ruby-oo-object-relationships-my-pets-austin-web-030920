class Cat
  attr_accessor :owner, :mood
  attr_reader :name, :species

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @species = 'cat'
    @mood = 'nervous'

    @@all << self
  end

  def self.all
    @@all
  end
end