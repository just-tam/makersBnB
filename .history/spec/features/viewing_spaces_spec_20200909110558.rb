# frozen_string_literal: true

require 'mongoid'

feature 'viewing spaces' do
  scenario 'it has a list of spaces' do

    Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500')

    visit ('/')

    expect(page).to have_content('Team Nomad House')
    expect(page).to have_content('It is a lovely place to stay')
    expect(page).to have_content('£500 per night')
  end
end