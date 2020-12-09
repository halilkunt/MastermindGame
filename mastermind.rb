require "colorize"

class Mastermind
  def initialize
  end

  def show_result(value)
    self.show_value(value)
    if self.secret_code == value
      puts "Right guess You won the game"
    else
      correct_place = 0
      correct_guess = 0
      value = value.split("")
      self.secret_code.split("").each_with_index do |number, index| 
        if number == value[index]
          correct_place += 1
        end
      end
      
      correct_guess = self.secret_code.split("").intersection(value).length

      puts "You have #{correct_place} correct place and #{correct_guess} correct number guess"

    end
  end

  def show_value(guess)
    guess.split("").each do |value|
      if value.to_i == 0
        print " #{value} ".on_red
      elsif value.to_i == 1
        print " #{value} ".on_blue
      elsif value.to_i == 2
        print " #{value} ".on_green
      elsif value.to_i == 3
        print " #{value} ".on_black
      elsif value.to_i == 4
        print " #{value} ".on_yellow
      elsif value.to_i == 5
        print " #{value} ".on_white
      else 
        print " #{value} ".on_magenta
      end
    end
    puts ""
  end

  def show_secret_code
    self.secret_code.split("").each do |value|
      if value.to_i == 0
        print " #{value} ".on_red
      elsif value.to_i == 1
        print " #{value} ".on_blue
      elsif value.to_i == 2
        print " #{value} ".on_green
      elsif value.to_i == 3
        print " #{value} ".on_black
      elsif value.to_i == 4
        print " #{value} ".on_yellow
      elsif value.to_i == 5
        print " #{value} ".on_white
      else 
        print " #{value} ".on_magenta
      end
    end
    puts ""
  end
end

class Human < Mastermind
  attr_accessor :secret_code, :guess

  def initialize
    @secret_code = ""
    @guess
  end

  def set_secret_code
    puts "Enter your secret code"
    self.secret_code = gets.chomp
  end

  def guess_secret_code
    puts "Enter your guess"
    self.guess = gets.chomp
  end
end

class Computer < Mastermind
  attr_accessor :secret_code, :guess

  def initialize
    @secret_code = ""
    @guess = ""
  end

  def set_secret_code
    4.times { self.secret_code += rand(7).to_s }
  end
  def guess_secret_code
    self.guess = ""
    4.times { self.guess += rand(7).to_s }
  end
end

def start_the_game(human, computer)

  puts "If you want to be breaker enter 'b' or If you want to be a maker enter 'm'"
  choice = gets.chomp

  until choice == 'b' || choice == 'm'
    puts "Please make a valid entry"
    choice = gets.chomp
  end

  if choice == "b"
    breaker = human
    maker = computer
  else
    breaker = computer
    maker = human
  end

  maker.set_secret_code

  10.times do |time|
    breaker.guess_secret_code
    maker.show_result(breaker.guess)

    if(maker.secret_code == breaker.guess)
      break
    end
  end

  unless maker.secret_code == breaker.guess
    puts "You lost the game the result is:"
    puts maker.show_secret_code
  end
end

human = Human.new
computer = Computer.new

start_the_game(human, computer)