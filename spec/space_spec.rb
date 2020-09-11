require './lib/space.rb'

describe Space do

  describe '.viewspaces' do
    it 'displays a list of spaces' do
      Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500', available_date: '12/09/20')
      space = Space.viewspaces.last
      expect(space.name).to eq('Team Nomad House')
      expect(space.description).to eq('It is a lovely place to stay')
      expect(space.price).to eq('£500')
      expect(space.available_date).to eq('12/09/20')
    end
  end

  describe '.create' do
    it 'adds a new space' do
      Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500', available_date: '12/09/20')
      space = Space.viewspaces.last

      expect(space).to be_a Space
      expect(space.name).to eq('Team Nomad House')
      expect(space.description).to eq('It is a lovely place to stay')
      expect(space.price).to eq('£500')
      expect(space.available_date).to eq('12/09/20')
    end
  end

  # describe '.request' do
  #   it 'reserves space for confirmation' do
  #     Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500', available_date: '12/09/20')
  #     space = Space.viewspaces.last
  #
  #     expect(space.available).to eq(true)
  #
  #     Space.request('Team Nomad House')
  #     space = Space.viewspaces.last
  #
  #     expect(space.available).to eq(false)
  #   end
  # end
end
