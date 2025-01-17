class Venue
    attr_reader :name,
                :capacity,
                :patrons

    def initialize(name, capacity)
        @name = name
        @capacity = capacity
        @patrons = []
    end

    def add_patron(name)
        @patrons << name
    end

    def yell_at_patrons
        @patrons.map { |p| p.upcase }
    end

    def over_capacity?
        @patrons.count > @capacity
    end

    def kick_out
        until over_capacity? == false
            @patrons.pop
        end
    end
end
