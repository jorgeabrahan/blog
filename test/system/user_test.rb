require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase

  test 'Profile picture is being displayed' do
    visit user_path(users(:one))
    assert_selector "img[src='https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541']"
  end

  test 'User username is being displayed' do
    visit user_path(users(:one))
    assert_text 'Jorge'
  end

  test 'Number of posts the user has written is being displayed' do
    visit user_path(users(:one))
    assert_text 'Amount of posts: 2'
  end
end
