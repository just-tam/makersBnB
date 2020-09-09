require './lib/space.rb'

describe Space do

  describe '.all' do
    it 'displays a list of spaces' do
      #Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500')

      expect(Space.all).to include('Team Nomad House')
      expect(Space.all).to include('It is a lovely place to stay')
      expect(Space.all).to include('£500')
    end  
  end
  


end