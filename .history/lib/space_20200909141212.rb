# require 'mongoid'

class Space


  def self.all
    @spaces = [ 
      { :name => 'Team Nomad House'},
      { :description => 'It is a lovely place to stay'},
      { :price => '£500' }    
    ]

  end  

  def self.create
    Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end  

  
end  