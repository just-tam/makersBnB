# require 'mongoid'

class Space

  def self.all
    @spaces = [ 
      { :name => 'Team Nomad House'},
      { :description => 'It is a lovely place to stay'},
      { :price => '£500' }    
    ]
    all = @spaces
    all.each do |space|
      space[:name],
      space[:description],
      space[:price]
    end

  end  

  
end  