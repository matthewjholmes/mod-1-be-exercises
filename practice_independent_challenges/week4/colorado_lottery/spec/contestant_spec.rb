require 'rspec'
require './lib/contestant'
require './lib/game'

describe Contestant do

    before :each do 
        @alex = Contestant.new({
                                        first_name: 'Alexander',
                                        last_name: 'Aigiades',
                                        age: 28,
                                        state_of_residence: 'CO',
                                        spending_money: 10
                                    })
    end

    describe '#initialize' do 
        it 'initializes' do 
            expect(@alex).to be_a Contestant
        end

        it 'responds to attribute calls' do 
            expect(@alex.first_name).to eq "Alexander"
            expect(@alex.last_name).to eq "Aigiades"
            expect(@alex.age).to eq 28
            expect(@alex.state_of_residence).to eq 'CO'
            expect(@alex.spending_money).to eq 10
        end
    end

    describe '#full_name' do
        it 'concats the first and last names with a space in between' do 
            expect(@alex.full_name).to eq "Alexander Aigiades"
        end
    end

    describe '#game_interests' do 
        it '#game_interests initializes as an empty array' do 
            expect(@alex.game_interests).to eq []
        end

        it "#add_game_interest" do 
            @alex.add_game_interest('Mega Millions')
            @alex.add_game_interest('Pick 4')

            expect(@alex.game_interests).to match_array ["Mega Millions", "Pick 4"]
        end
    end
end