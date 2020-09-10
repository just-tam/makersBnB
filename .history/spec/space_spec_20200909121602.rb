require 'space'

describe Space do

  describe '.all' do
    it 'displays a list of spaces' do
      #Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500')

      expect(Space.all).to eq('Team Nomad House', 'It is a lovely place to stay', '£500')
    end
    
  end
  


end