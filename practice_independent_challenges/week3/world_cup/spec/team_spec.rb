require 'rspec'
require './lib/team'
require './lib/player'

describe Team do 

    before :each do 
        @team = Team.new("France")
    end 

    describe '#initialize' do 
        it 'can create a Team object with country name' do 
            expect(@team).to be_a Team
            expect(@team.country).to eq "France"
        end
    end

    describe '#eliminated? and #eliminate' do
    # I am choosing to rename the "eliminated" method in the prescribed interaction pattern to "eliminate" for greater clarity of its function

        it '#eliminated? false by default' do
            expect(@team.eliminated?).to eq false
        end
        
        it '#eliminate changes #eliminated? to true' do 
            @team.eliminate

            expect(@team.eliminated?).to eq true
        end
    end

    describe 'players on team' do 
        it '#players is an empty arry by default' do 
            expect(@team.players).to eq []
        end

        it '#add_player adds to teams players' do 
            mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
            pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
            @team.add_player(mbappe)
            @team.add_player(pogba)

            expect(@team.players).to match_array [mbappe, pogba]
        end
       
        it '#players_by_position can filter players by their position' do
            mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
            pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
            @team.add_player(mbappe)
            @team.add_player(pogba)

            expect(@team.players_by_position("midfielder")).to eq [pogba]
            expect(@team.players_by_position("forward")).to eq [mbappe]
            expect(@team.players_by_position("defender")).to eq []
        end
    end
end