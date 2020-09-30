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

  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert @user.invalid?
  end

  test 'username should be present' do
    @user.username = nil
    assert @user.invalid?
  end

  test 'username should not be too long' do
    @user.username = 'a' * 31
    assert @user.invalid?
  end

  test 'email should be present' do
    @user.email = nil
    assert @user.invalid?
  end

  test 'email validation should accept valid address' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid address' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert @user.invalid?, "#{invalid_address.inspect} should be invalid"
    end
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
