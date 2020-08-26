require './lib/station.rb'

describe 'A station' do
  it 'says its name' do
    station = Station.new(name: 'Bank', zone: 1)
    expect(station.name).to eq 'Bank'
  end

  it 'says what zone it is' do
    station = Station.new(name: 'Bank', zone: 1)
    expect(station.zone).to eq 1
  end
end
