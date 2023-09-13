require 'rspec'
require './lib/contestant'
require './lib/game'
require './lib/colorado_lottery'

describe ColoradoLottery do
    before :each do 
        @lottery = ColoradoLottery.new
        @pick_4 = Game.new('Pick 4', 2)
        @mega_millions = Game.new('Mega Millions', 5, true)
        @cash_5 = Game.new('Cash 5', 1)
        @alexander = Contestant.new({
                            first_name: 'Alexander',
                            last_name: 'Aigades',
                            age: 28,
                            state_of_residence: 'CO',
                            spending_money: 10})
        @benjamin = Contestant.new({
                            first_name: 'Benjamin',
                            last_name: 'Franklin',
                            age: 17,
                            state_of_residence: 'PA',
                            spending_money: 100})
        @frederick = Contestant.new({
                            first_name:  'Frederick',
                            last_name: 'Douglass',
                            age: 55,
                            state_of_residence: 'NY',
                            spending_money: 20})
       @winston = Contestant.new({
                            first_name: 'Winston',
                            last_name: 'Churchill',
                            age: 18,
                            state_of_residence: 'CO',
                            spending_money: 5})
        @alexander.add_game_interest('Pick 4')
        @alexander.add_game_interest('Mega Millions')
        @frederick.add_game_interest('Mega Millions')
        @winston.add_game_interest('Cash 5')
        @winston.add_game_interest('Mega Millions')
        @benjamin.add_game_interest('Mega Millions')
    end

    describe '#initialize' do 
        it 'can initialize a ColoradoLottery' do 
            expect(@lottery).to be_a ColoradoLottery
        end
        
        it 'initializes with empty collections' do 
            expect(@lottery.registered_contestants).to be_a Hash
            expect(@lottery.registered_contestants.empty?).to eq true
            #I have not idea why the below test is failing/expecting 1 arg but the above tests are passing. Same with current_contestants below.
            # expect(@lottery.registered_contestants).to eq {}

            expect(@lottery.winners).to eq []
            
            expect(@lottery.current_contestants).to be_a Hash
            expect(@lottery.current_contestants.empty?).to eq true
            # expect(@lottery.current_contestants).to eq {}
        end
    end

    describe '#interested_and_18?' do 
        it 'returns true if both contestant is >= 18 and interested game' do 
            expect(@lottery.interested_and_18?(@alexander, @pick_4)).to eq true
        end

        it 'returns false if either contestant < 18 or not interested in game' do
            expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to eq false
            expect(@lottery.interested_and_18?(@alexander, @cash_5)).to eq false
        end
    end

    describe '#can_register?' do 
        it 'returns true if #interested_and_18? is true and either CO resident or national game' do
            expect(@lottery.can_register?(@alexander, @pick_4)).to eq true
            expect(@lottery.can_register?(@frederick, @mega_millions)).to eq true
        end

        it 'returns false if either #interested_and_18? is false and neither a CO resident nor national game' do 
            expect(@lottery.can_register?(@alexander, @cash_5)).to eq false
            expect(@lottery.can_register?(@benjamin, @mega_millions)).to eq false
            expect(@lottery.can_register?(@frederick, @cash_5)).to eq false
        end
    end
end