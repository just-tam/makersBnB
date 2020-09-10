# frozen_string_literal: true

# require 'mongoid'
require './lib/space.rb'

feature 'viewing spaces' do
  scenario 'it has a list of spaces' do

    Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500', available_date: '12/09/20')

    visit ('/spaces')

    expect(page).to have_content('Team Nomad House')
    expect(page).to have_content('It is a lovely place to stay')
    expect(page).to have_content('£500')
  end
end