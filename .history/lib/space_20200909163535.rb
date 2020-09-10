# require 'mongoid'

class Space

  attr_reader :name, :description, :price

  def initialize(name:, description:, price:, start_date:, end_date:)
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @end_date = end_date
  end

  def self.all
    @spaces = [ 
      { :name => 'Team Nomad House'},
      { :description => 'It is a lovely place to stay'},
      { :price => '£500' }    
    ]

  end  

  def self.create
    Space.new(name:, description:, price:, start_date:, end_date:)
  end
  
end
