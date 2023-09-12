require 'rspec'
require './lib/team'
require './lib/player'
require './lib/world_cup'

describe WorldCup do
    before :each do 
        @france = Team.new("France")
        @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        @pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
        @france.add_player(@mbappe)
        @france.add_player(@pogba)

        @croatia = Team.new("Croatia")
        @modric = Player.new({name: "Luka Modric", position: "midfielder"})
        @vida = Player.new({name: "Domagoj Vida", position: "defender"})
        @croatia.add_player(@modric)
        @croatia.add_player(@vida)

        @world_cup = WorldCup.new(2018, [@france, @croatia])
    end

    describe 'initializes with year and teams' do
        it 'is a WorldCup' do 
            expect(@world_cup.class).to eq WorldCup
        end

        it '#year' do
            expect(@world_cup.year).to eq 2018
        end

        it '#teams' do 
            expect(@world_cup.teams).to match_array [@croatia, @france]
        end
    end

    describe '#active_players_by_position' do
        it '#active_teams helper method' do 
            expect(@world_cup.active_teams).to match_array [@croatia, @france]
            
            @france.eliminate
            
            expect(@world_cup.active_teams).to match_array [@croatia]
        end

        it 'returns array of players across all teams playing by position' do
            expect(@world_cup.active_players_by_position("midfielder")).to match_array [@pogba, @modric]
        end

        it 'only returns players still in the competition' do 
            @croatia.eliminate

            expect(@world_cup.active_players_by_position("midfielder")).to match_array [@pogba]
        end
    end
end