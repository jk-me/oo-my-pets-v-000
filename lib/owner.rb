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
    @all=[]
  end
  def say_species
    return "I am a #{self.species}"
  end 
  #def pets
    #@pets
  #end 
  def buy_fish(name)
    fish=Fish.new(name)
    self.pets[0] << fish 
  end 
  def buy_cat(name)
    cat=Cat.new(name)
    self.pets[1] << cat 
  end
  def buy_dog(name)
    dog=Dog.new(name)
    self.pets[2] << dog 
  end 
  def walk_dogs 
    self.pets[2].each { |d| d.mood='happy'}
  end 
  def play_with_cats
    self.pets[1].each { |c| c.mood='happy'}
  end 
  def feed_fish
    self.pets[0].each { |f| f.mood='happy'}
  end 
  def sell_pets 
    self.pets.each{|pets,p| p.mood = 'nervous'}
    @pets={:fishes =>[], :cats =>[], :dogs =>[]}
  end 
  def
end

describe Owner do
  let(:owner) { Owner.new("human") }
  let(:fish) { Fish.new("Nemo") }
  let(:cat) { Cat.new("Crookshanks") }
  let(:dog) { Dog.new("Fido") }
  context 'instance methods' do
    describe "#sell_pets" do
      it 'can sell all its pets, which make them nervous' do
        fido = Dog.new("Fido")
        tabby = Cat.new("Tabby")
        nemo = Fish.new("Nemo")
        [fido, tabby, nemo].each {|o| o.mood = "happy" }
        owner.pets = {
          :dogs => [fido, Dog.new("Daisy")],
          :fishes => [nemo],
          :cats => [Cat.new("Mittens"), tabby]
        }
        owner.sell_pets
        owner.pets.each {|type, pets| expect(pets.empty?).to eq(true) }
        [fido, tabby, nemo].each { |o| expect(o.mood).to eq("nervous") }
      end
    end

    describe "#list_pets" do
      it 'can list off its pets' do
        owner.buy_fish("Bubbles")
        owner.buy_fish("Nemo")
        owner.buy_cat("Crookshanks")
        owner.buy_dog("Fido")
        owner.buy_dog("Snuffles")
        owner.buy_dog("Charley")
        expect(owner.list_pets).to eq("I have 2 fish, 3 dog(s), and 1 cat(s).")
      end
    end
  end
end
