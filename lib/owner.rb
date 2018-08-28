class Owner
  attr_accessor :name, :pets
  attr_reader :species 
  @@all=[]
  def initialize(species)
    @species=species
    @@all << self
    @pets={:fishes =>[], :cats =>[], :dogs =>[]}
  end 
  def self.all 
    @@all 
  end
  def self.count
    @@all.length 
  end 
  def self.reset_all
    @@all=[]
  end
  def say_species
    return "I am a #{self.species}."
  end 
  def pets
    @pets
  end 
  def buy_fish(name)
    fish=Fish.new(name)
    self.pets[:fishes] << fish 
  end 
  def buy_cat(name)
    cat=Cat.new(name)
    self.pets[:cats] << cat 
  end
  def buy_dog(name)
    dog=Dog.new(name)
    self.pets[:dogs] << dog 
  end 
  def walk_dogs 
    self.pets[:dogs].each { |d| d.mood='happy'}
  end 
  def play_with_cats
    self.pets[:cats].each { |c| c.mood='happy'}
  end 
  def feed_fish
    self.pets[:fishes].each { |f| f.mood='happy'}
  end 
  def sell_pets 
    self.pets.each{|key,val| val.each{|a| a.mood = 'nervous'}}
    @pets={:fishes =>[], :cats =>[], :dogs =>[]}
  end 
  def list_pets 
    return "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end

