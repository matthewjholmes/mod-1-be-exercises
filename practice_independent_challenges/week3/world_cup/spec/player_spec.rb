require 'rspec'
require './lib/player.rb'

describe Player do 

    describe '#initialize' do 
        it 'is a Player' do 
            player = Player.new({name: "Luka Modric", position: "midfielder"})
            expect(player).to be_a Player
        end
    end

    describe 'player details' do 
        before :each do 
            @player = Player.new({name: "Luka Modric", position: "midfielder"}) 
        end

        it '#details helper method responds with hash of details' do
            expect(@player.details).to be_a Hash
            @player.details.each do |k,v|
                expect(k).to be_a Symbol
                expect(v).to be_a String
            end
        end

        it '#name returns name string' do 
            expect(@player.name).to eq "Luka Modric"
        end

        it '#position returns position string' do 
            expect(@player.position).to eq "midfielder"
        end
    end
end