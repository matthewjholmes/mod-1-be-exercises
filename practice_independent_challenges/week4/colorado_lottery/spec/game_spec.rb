require 'rspec'
require './lib/contestant'
require './lib/game'

describe Game do 

    describe '#initialize' do 
        it 'initializes with name and cost' do 
            pick_4 = Game.new('Pick 4', 2)

            expect(pick_4).to be_a Game
            expect(pick_4.name).to eq "Pick 4"
            expect(pick_4.cost).to eq 2
        end

        it 'accepts an optional argument for national_drawing' do 
            pick_4 = Game.new('Pick 4', 2)
            mega_millions = Game.new('Mega Millions', 5, true)

            expect(pick_4.national_drawing).to eq false
            expect(mega_millions.national_drawing).to eq true
        end
    end

end