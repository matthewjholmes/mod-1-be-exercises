require 'Date'

class ColoradoLottery
    attr_reader :winners,
                :current_contestants,
                :registered_contestants,

    def initialize()
        @registered_contestants = Hash.new
        @winners = []
        @current_contestants = {}
    end

    def interested_and_18?(contestant, game)
        interest = contestant.game_interests.include?(game.name)
        age = contestant.age >= 18

        interest && age
    end

    def can_register?(contestant, game)
        interest_and_age = interested_and_18?(contestant, game)
        resident = contestant.state_of_residence == 'CO'
        national_drawing = game.national_drawing

        interest_and_age && (resident || national_drawing)
    end

    def register_contestant(contestant)
        registered_games = []
        inelibible_games []

        contestant.game_interests.each do |game|
            if can_register?(contestant, game)
                @registered_contestants[game] ||= []
                @registered_contestants[game] << contestant
                registered_games << game
            else
                inelibible_games << game
            end
        end

        if inelibible_games.empty?
            puts "Success! #{contestant} has been registered for #{contcat_games(registered_games)}. They will be in the next drawing if funds are sufficient."
        else
            puts "Sorry, but #{contestant} is inelibible to register for #{contcat_games(inelibible_games)}."
            puts "#{contestant} has been registered successfully for #{contcat_games(registered_games)}. They will be in the next drawing if funds are sufficient."
        end
    end

    def contcat_games(games)
        game_string = []
        games.each do |game|
            game_string << game
            game_string << ", "
        end
        game_string.pop
        game_string.insert(-2, "and ")
        game_string.join
    end

    def elibible_contestants(game)
        @registered_contestants[game].select do |contestant|
            contestant.spending_money >= game.cost
        end
    end

    def current_contestants
        games_contestants = {}
        games = @registered_contestants.keys
        games.each do |game|
            games_contestants[game] ||= []
            elibible_contestants(game).each do |contestant|
                contestant -= game.cost
                games_contestants[game] << contestant.name
            end
        end
        games_contestants
    end

    def draw_winners
        winners = {}
        current_contestants.each do |game, contestants|
            winner = contestants.sample
            winners[winner.name] = game.name
        end
        date = Date.today.strftime("%A, %B %d, %Y")
        @winners << {date => winners}
    end
end