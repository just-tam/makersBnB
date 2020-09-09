require './lib/space.rb'

describe Space do

  describe '.all' do
    it 'displays a list of spaces' do
      # Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500')

      expect(Space.all).to include(name: 'Team Nomad House')
      expect(Space.all).to include(description: 'It is a lovely place to stay')
      expect(Space.all).to include(price: '£500')
    end  
  end
  
  describe '.create' do
    it 'adds a new space' do
      space = Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500')

      expect(space).to be_a Space
      expect(space.name).to eq('Team Nomad House')
      expect(space.description).to eq('It is a lovely place to stay')
      expect(space.price).to eq('£500')

    end
  end
  


end