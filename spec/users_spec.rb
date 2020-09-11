describe 'create' do
  it 'creates a new user' do
    user = User.create(username: 'testuser', email: 'test@email.com', password: 'password123')

    expect(user).to be_a User
    expect(user.username).to eq 'testuser'
  end
end
