class Contestant
    attr_reader :first_name,
                :last_name,
                :age,
                :state_of_residence,
                :game_interests
    attr_accessor :spending_money

    def initialize(attr)
        @first_name = attr[:first_name]
        @last_name = attr[:last_name]
        @age = attr[:age]
        @state_of_residence = attr[:state_of_residence]
        @spending_money = attr[:spending_money]
        @game_interests = []
    end

    def full_name
        @first_name + " " + @last_name
    end

    def add_game_interest(game_name)
        @game_interests << game_name
    end
end