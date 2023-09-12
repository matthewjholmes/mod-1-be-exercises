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
            expect(@world_cup).to be_a WorldCup
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
            expect(@world_cup.active_players_by_position("midfielder")).to be_a Array
            expect(@world_cup.active_players_by_position("midfielder")).to match_array [@pogba, @modric]
        end

        it 'only returns players still in the competition' do 
            @croatia.eliminate

            expect(@world_cup.active_players_by_position("midfielder")).to match_array [@pogba]
        end
    end

    describe '#all_players_by_position' do 
        it 'returns a hash with string keys and arrays of Player objects as values' do
            expect(@world_cup.all_players_by_position).to be_a Hash
            @world_cup.all_players_by_position.each do |k,v|
                expect(k).to be_a String
                expect(v).to be_a Array
                expect(v.sample).to be_a Player
            end
        end

        it 'assigns correct players to the hash' do 
            players = {
                'forward' => [@mbappe],
                'midfielder' => [@pogba, @modric],
                'defender' => [@vida]
            }

            expect(@world_cup.all_players_by_position).to match players
        end
    end
end