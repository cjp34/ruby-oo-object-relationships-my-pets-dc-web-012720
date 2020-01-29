require 'pry'
require './cat.rb'
require './dog.rb'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end
  
  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do | cat |
      cat.owner == self
    end
  end
  
  def dogs
      Dog.all.select do | dog |
        dog.owner == self
      end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do | dog |
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.select do | cat |
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end

  def sell_pets
    Cat.all.select do | cat |
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end
    Dog.all.select do | dog |
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end
  end

  def list_pets
    dog_count = 0
    cat_count = 0

    Dog.all.each do | dog |
      if dog.owner == self
        dog_count +=1
      end
    end

    Cat.all.each do | cat |
      if cat.owner == self
        cat_count += 1
      end
    end

    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end