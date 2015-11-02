class Game
    
    def intro
        @number = rand(100)
        @tries = 0
        
        puts "Guess a number between 0 and 100"
        main
    end
    
    def main
        loop do
            @tries += 1
            @guess = gets.chomp.to_i
            
            if @guess == @number
                win
                exit
            elsif @guess > @number
                puts "Guess lower"
            else
                puts "Guess higher"
            end
        end
    end
    
    def win
        puts "Congratulations. It took you #{@tries} tries!"
    end
end

Game.new.intro
