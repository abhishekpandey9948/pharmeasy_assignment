require 'test_helper'

class UserTest < ActiveSupport::TestCase

  #must pass
  test "check for uuid generation" do
    user = User.new
    user.email = 'abhishek.pandey@gmail.com'
    user.password = 'abhishek'
    user.users_role = create_user_role
    assert user.save!
    assert_not_empty user.uuid
  end

  #must fail
  test "should not have user without access role" do
    user = User.new
    user.email = 'abhishek.pandey@gmail.com'
    user.password = 'abhishek'
    assert user.save!
  end

  private

  def create_user_role
    user_role = ::Users::Role.new
    user_role.name = 'Patient'
    user_role.save!
    user_role
  end

end
