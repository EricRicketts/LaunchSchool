require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseSevenTest < Minitest::Test
  class Owner
    attr_reader :name
    attr_accessor :number_of_pets

    def initialize(name)
      @name = name
      @number_of_pets = 0
    end
  end

  class Pet
    attr_reader :type, :name

    def initialize(type, name)
      @type = type
      @name = name
    end
  end

  class Shelter
    attr_reader :adoptions

    def initialize
      @adoptions = Hash.new { |h, k| h[k] = Array.new }
    end

    def adopt(owner, pet)
      owner.number_of_pets += 1
      adoptions[owner].push(pet)
    end

    def print_adoptions
      adoptions.inject([]) do |entire_phrase, (owner, pets)|
        owner_phrase = "#{owner.name} has adopted the following pets:"
        entire_phrase << pets.inject([owner_phrase]) do |phrase, pet|
          phrase << ["a #{pet.type} named #{pet.name}"]
        end.join("\n")
      end.join("\n\n")
    end

  private

  attr_writer :adoptions
  end

  def test_one
    butterscotch = Pet.new('cat', 'Butterscotch')
    pudding      = Pet.new('cat', 'Pudding')
    darwin       = Pet.new('bearded dragon', 'Darwin')
    kennedy      = Pet.new('dog', 'Kennedy')
    sweetie      = Pet.new('parakeet', 'Sweetie Pie')
    molly        = Pet.new('dog', 'Molly')
    chester      = Pet.new('fish', 'Chester')

    phanson = Owner.new('P Hanson')
    bholmes = Owner.new('B Holmes')

    shelter = Shelter.new
    shelter.adopt(phanson, butterscotch)
    shelter.adopt(phanson, pudding)
    shelter.adopt(phanson, darwin)
    shelter.adopt(bholmes, kennedy)
    shelter.adopt(bholmes, sweetie)
    shelter.adopt(bholmes, molly)
    shelter.adopt(bholmes, chester)

    expected_printed_adoptions = <<-ADOPTIONS
P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Kennedy
a parakeet named Sweetie Pie
a dog named Molly
a fish named Chester
ADOPTIONS

    result_printed_adoptions = shelter.print_adoptions

    hanson_expected = "P Hanson has 3 adopted pets."
    holmes_expected = "B Holmes has 4 adopted pets."
    adoption_expected = [
      hanson_expected, holmes_expected
    ]
    adoption_results = [
      "#{phanson.name} has #{phanson.number_of_pets} adopted pets.",
      "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
    ]

    assert_equal(adoption_expected, adoption_results)
    assert_equal(expected_printed_adoptions.chomp, result_printed_adoptions)
  end
end
