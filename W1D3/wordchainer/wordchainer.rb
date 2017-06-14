require 'set'

class WordChainer
  attr_reader :dictionary

  def initialize
    @dictionary = File.readlines('dictionary.txt').map(&:chomp)
    @dictionary = Set.new(@dictionary)
  end

  def adjacent_words(word)
    storage = []
    word.each.char.with_index do |old_letter, i|
      ('a'..'z').each do |new_letter|
        next if old_letter == new_letter

        new_word = word.dup
        new_word[i] = new_letter

        storage << new_word if dictionary.include?(new_word)
      end
    end
    storage
  end

  def run(souce, target)
    
  end





end
