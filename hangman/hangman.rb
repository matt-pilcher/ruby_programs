require 'yaml'

class Game
	def initialize
		@secret_word = File.read('5desk.txt').lines.select {|word| (5..12).cover?(word.strip.size)}.sample.strip.downcase
		@guesses = []
		@trial =  @secret_word.gsub(/[a-z]/, '_ ')
		@attempts = 8
		@y = 0
		intro
	end
	
	def replace_letters(word, letters)
	  string = "[^" + letters.join + "]"
	  regex = Regexp.new(string)
	  new_word = word.gsub(regex, ' _ ')
	end
	
	def intro
		puts "Welcome to the game"
		puts "1.) New Game"
		puts "2.) Load Game"
		@selection = gets.chomp.to_i
		
		case
		when @selection == 1
			main
		when @selection == 2
			load_game
		else
			puts "Error"
			intro
		end
	end
	
	def load_game
		content = File.open('saved_games/saved.yaml', 'r') {|file| file.read}
		YAML.load(content)
	end
	
	def save_game
		Dir.mkdir('saved_games') unless Dir.exists? 'saved_games'
		filename = 'saved_games/saved.yaml'
		File.open(filename,'w') do |file|
			file.puts YAML.dump(self)
		end
	end
	
	def main
		loop do
			puts @trial
			puts "You have #{@attempts} chances left"
			puts "Choose a letter"
			choice = gets.chomp
			
			if choice == 'save'
				save_game
				puts "Game has been saved"
				exit
			end
			
			if @secret_word.include?(@trial)
				puts "You already guessed this letter"
			elsif @secret_word.include?(choice)
				@guesses << choice
				@trial = replace_letters(@secret_word, @guesses)
				
				puts "You found a letter"
				if @trial == @secret_word
					win
					exit
				end
			else
				puts "Not a letter"
				@attempts -= 1
				if @attempts == 0
					lose
					exit
				end
			end
		end
	end
	
	def lose
		puts "You ran out of chances. The word was [#{@secret_word}]"
	end
	
	def win
		puts "Congratulations! You guessed the word"
	end
end

Game.new
	





