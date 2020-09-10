# require 'mongoid'

class Space

  attr_reader :id, :title, :url

  def initialize(name:, description:, price:)
		@name = name
		@description = description
		@price = price
	end

  def self.all
    @spaces = [ 
      { :name => 'Team Nomad House'},
      { :description => 'It is a lovely place to stay'},
      { :price => '£500' }    
    ]

  end  

  def self.create
    Space.new(name: , description: , price: )
  end
  
end
