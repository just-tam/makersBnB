describe 'create' do
  it 'creates a new user' do
    user = User.create(username: 'testuser', email: 'test@email.com', password: 'password123')

    expect(user).to be_a User
    expect(user.username).to eq 'testuser'
    expect(user.email).to eq 'test@email.com'
    expect(user.password).to eq 'password123'
  end
end