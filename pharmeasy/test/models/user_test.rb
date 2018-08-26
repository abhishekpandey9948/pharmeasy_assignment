require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not have user without uuid" do
    user = User.new
    user.email = 'abhishek.pandey@gmail.com'
    user.password = 'abhishek'
    user.users_role = create_user_role
    assert user.save!
    assert_not_empty user.uuid
  end

  private

  def create_user_role
    user_role = ::Users::Role.new
    user_role.name = 'Patient'
    user_role.save!
    user_role
  end

end
