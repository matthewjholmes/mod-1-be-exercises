class WorldCup
    attr_reader :year,
                :teams

    def initialize(year, teams)
        @year = year
        @teams = teams
    end

    def active_teams
        @teams.select do |team|
            team.eliminated? == false
        end
    end

    def active_players_by_position(position)
        active_teams.flat_map do |team|
            team.players_by_position(position)
        end
    end

    def all_players_by_position
        all_players = {}
        @teams.each do |team|
            team.players.each do |player|
                all_players[player.position] ||= []
                all_players[player.position] << player
            end
        end
        all_players
    end
end