feature 'homepage logo' do
  scenario 'logo is shown on homepage' do
    visit ('/')
    expect(page).to have_content('Nomads')
  end
end