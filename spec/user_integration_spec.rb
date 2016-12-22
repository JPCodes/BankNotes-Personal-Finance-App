require('spec_helper')

describe('the user route', {:type => :feature}) do
  it('will create a new user profile and login') do
    visit('/')
    click_link('Create New Account')
    fill_in('username', :with => 'Moneybags')
    fill_in('password', :with => 'secure')
    fill_in('password_confirmation', :with => 'secure')
    click_button('Create Account')
    fill_in('username', :with => 'Moneybags')
    fill_in('password', :with => 'secure')
    click_button('Sign In')
    expect(page).to have_content('Hello, Moneybags!')
    click_link('Edit Profile')
    fill_in('name', :with => 'Pennywise')
    click_button('Edit Name')
    click_link('Accounts')
    expect(page).to have_content('Hello, Pennywise!')
    click_link('Sign Out')
    expect(page).to have_content('Organize')
    fill_in('username', :with => 'Pennywise')
    fill_in('password', :with => 'secure')
    click_button('Sign In')
    click_link('Edit Profile')
    click_button('Delete Profile')
    expect(page).to have_content('Organize')
  end
end
