class ColoradoLottery
    attr_reader :registered_contestants,
                :winners,
                :current_contestants
                

    def initialize
        @registered_contestants = {}
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
end