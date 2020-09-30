require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @user.password = 'foobar'
    @user.password_confirmation = 'foobar'
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = nil
    assert @user.invalid?
  end

  test 'username should be present' do
    @user.username = nil
    assert @user.invalid?
  end

  test 'email should be present' do
    @user.email = nil
    assert @user.invalid?
  end

  test 'password should be present' do
    @user.password = @user.password_confirmation = '       '
    assert @user.invalid?
  end

  test 'password should have as minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert @user.invalid?
  end
end
