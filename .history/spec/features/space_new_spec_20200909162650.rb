feature 'adding a new space' do
  scenario 'adds a new space to the database' do
    
    visit('/viewspaces/new')

    fill_in('name', with: 'Team Nomad House')
    fill_in('description', with: 'It is a lovely place to stay')
    fill_in('price', with: '£500')

  end

end