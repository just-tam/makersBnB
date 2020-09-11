# frozen_string_literal: true

require './lib/space.rb'

feature 'request button' do
  scenario 'it submits a request for a space' do

    Space.create(name: 'Team Nomad House', description: 'It is a lovely place to stay', price: '£500', available_date: '12/09/20')

    visit ('/spaces')
    #click_button('Team Nomad House')

    expect(page).to have_content('Team Nomad House')

  end
end
