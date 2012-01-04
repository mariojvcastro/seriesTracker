require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user creation without required fields' do
    user1 = User.create()
    assert user1.invalid?, "name, email and password missing on user creation"
    user1 = User.create(:name => 'test')
    assert user1.invalid?, "email and password missing on user creation"
    user1 = User.create(:name => 'test', :email => 'test@test.com')
    assert user1.invalid?, "password missing on user creation"
    user1 = User.create(:name => 'test', :email => 'test@test.com', :password => 'test')
    assert user1.valid?
  end

  test 'should have unique name' do
    user1 = User.create(:name => 'test')
    user2 = User.create(:name => user1.name)
    assert user2.invalid?, "user name must be unique"
  end
  
  test 'password must fit the format' do
    user1 = User.create(:name => 'test', :email => 'test123', :password => 'test')
    assert user1.invalid?, "password incorrect when creating user"
    user1 = User.create(:name => 'test', :email => 'test@test.com', :password => 'test')
    assert user1.valid?
    #user1 = User.update(:name => 'test', :email => 'test123test.com', :password => 'test')
    #assert user1.invalid?, "password incorrect when updating user"
    #user1 = User.update(:name => 'test', :email => 'test@test.com', :password => 'test')
    #assert user1.valid?
  end  
    
end
