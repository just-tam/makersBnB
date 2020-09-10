feature 'adding a new space' do
  scenario 'adds a new space to the database' do
    
    visit('/viewspaces/new')

    fill_in('name', with: 'Team Nomad House')
    fill_in('description', with: 'It is a lovely place to stay')
    fill_in('price', with: '£500')
    fill_in('start_date', with: '12/09/2020')
    fill_in('end_date', with: '14/09/2020')
    click_button('Submit')

    expect(page).to have_content('Team Nomad House')
    expect(page).to have_content('It is a lovely place to stay')
    expect(page).to have_content('£500')
    expect(page).to have_content('12/09/2020')
    expect(page).to have_content('14/09/2020')

  end

end