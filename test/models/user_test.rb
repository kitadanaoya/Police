require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example", email: "example@gmail.com", password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be exist" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "name length =< 50" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "email length =< 255" do
    @user.email = "a" * 246 + "@gmail.com"
    assert_not @user.valid?
  end
  
  test "email should be valid format" do
     valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
     valid_addresses.each do |valid_address|
       @user.email = valid_address
       assert @user.valid?, "#{valid_address.inspect} should be valid"
     end
  end
  
  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "email-letter should be saved as lower-case" do 
    mixed_case_email = "AbCdE@gmail.com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email 
  end
  
  test "password should be present" do
    @user.password = @user.password_confirmation = "" * 6
    assert_not @user.valid?
  end
  
  test "password length > 5" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
