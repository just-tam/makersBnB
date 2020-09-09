# frozen_string_literal: true

require './lib/space.rb'

feature 'viewing spaces' do
  scenario 'it has a list of spaces' do
    visit '/'
    expect(page).to have_content('Team Nomad House')
    expect(page).to have_content('It is a lovely place to stay')
    expect(page).to have_content('£500 per night')
  end
end