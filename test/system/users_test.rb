require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'Names of all users are being displayed' do
    visit users_path(users)
    assert_text "Jorge"
    assert_text "Juan"
  end
end
