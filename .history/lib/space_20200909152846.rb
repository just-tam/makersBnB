# require 'mongoid'

class Space

  attr_reader :name, :description, :price

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
    Space.new
  end
  
end
