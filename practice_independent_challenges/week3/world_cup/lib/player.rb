class Player
    attr_reader :details,
                :name,
                :position

    def initialize(details)
        @details = details
        @name = details[:name]
        @position = details[:position]
    end
end