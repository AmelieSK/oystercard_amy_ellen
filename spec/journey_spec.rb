require './lib/journey.rb'

describe 'A journey' do
  it 'has a start' do
    # set up
    station = test_double('station')
    allow(station).to receive(:name) { 'Bank' }
    journey = Journey.new
    journey.start(station)
    # verify
    expect(journey.start_point).to eq 'Bank'
  end

  it 'has an end' do
    # set up
    journey = Journey.new
    station = test_double
    allow(station).to receive(:name) { 'Victoria' }
    journey.end(station)
    # verify
    expect(journey.end_point).to eq 'Victoria'
  end
end
