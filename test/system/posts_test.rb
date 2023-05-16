require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test 'User profile picture is being displayed' do
    visit user_posts_path(users(:one))
    assert_selector "img[src='https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541']"
  end
end