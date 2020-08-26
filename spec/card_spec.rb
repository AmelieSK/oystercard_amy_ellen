require './lib/card.rb'

describe 'Card' do
  it 'has a capacity' do
    # set up
    card = Card.new
    # execute

    # verify
    expect(card.max_value).to eq 90
  end

  it 'adds money' do
    # set up
    card = Card.new
    money = 10
    # execute
    card.add(money)
    # verify
    expect(card.balance).to eq money
  end

  it 'doesn\'t allow too much money to be added' do
    # set-up
    card = Card.new
    # verify
    expect(card.add(100)).to eq 'You can only top up to £90 maximum'
  end

  it 'touches in to start a journey' do
    # set up
    journey_class = test_double
    journey = test_double
    allow(journey_class).to receive(:new) { journey }
    allow(journey).to receive(:start) {}
    allow(journey).to receive(:start_point) { 'Kings Cross' }
    card = Card.new(journey: journey_class)
    station = test_double
    # verify
    expect(card.touch_in(station)).to eq 'Kings Cross'
  end

  it 'touches out to end a journey' do
    # set up
    journey_class = test_double('journey class')
    journey = test_double('journey instance')
    station1 = test_double
    station2 = test_double
    allow(journey_class).to receive(:new) { journey }
    allow(journey).to receive(:start) {}
    allow(journey).to receive(:start_point) {}
    allow(journey).to receive(:end) {}
    allow(journey).to receive(:end_point) { 'Victoria' }
    card = Card.new(journey: journey_class)
    card.touch_in(station1)
    # verify
    expect(card.touch_out(station2)).to eq 'Victoria'
  end

end
