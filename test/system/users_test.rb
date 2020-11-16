require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'sign up with valid inputs' do
    visit root_path

    click_on 'Sign Up'

    fill_in 'Name', with: 'Michael Jordan'
    fill_in 'Username', with: 'michael'
    fill_in 'Email', with: 'michael@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Submit'

    assert_text 'Michael Jordan'.split.map(&:first).join
  end

  test 'sign up with blank inputs' do
    visit root_path

    click_on 'Sign Up'

    click_on 'Submit'

    assert_text 'Name can\'t be blank'
    assert_text 'Username can\'t be blank'
    assert_text 'Email can\'t be blank'
    assert_text 'Password can\'t be blank'
  end
end
