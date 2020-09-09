class Space
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :price, type: Integer
  field :start_date, type: String
  field :end_date, type: String

  belongs_to :user

  # attr_reader :name, :description

  # def initialize(name:, description:)
  #   @name = name
  #   @description = description
  #   # @price = price
  #   # @start_date = start_date
  #   # @end_date = end_date
  # end

  def self.viewspaces()
    spaces = Space.all.to_json
    json = JSON.parse(spaces)
    #puts json[0]['price']
    json.each do |arr|
      (
        # description: k['description']
        arr.each do |k, v|
          puts "#{k}: #{v}"
        end
      )
    end
  end

  # def self.create_space
  #   Space.create(username:'nomad3', email:'nomad3@email.com', password:'octopus12?')
  # end

end