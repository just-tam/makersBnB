require './lib/space.rb'

describe Space do

  describe '.all' do
    it 'displays a list of spaces' do
      #Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500')

      expect(Space.all).to include(name: 'Team Nomad House')
      expect(Space.all).to include(description: 'It is a lovely place to stay')
      expect(Space.all).to include(price: '£500')
    end  
  end
  


end