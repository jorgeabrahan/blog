require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test 'User profile picture is being displayed' do
    visit user_posts_path(users(:one))
    assert_selector "img[src='https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541']"
  end
  test 'User username is being displayed' do
    visit user_posts_path(users(:one))
    assert_text "Jorge"
  end
  test 'Number of posts of the user is being displayed' do
    visit user_posts_path(users(:one))
    assert_text 'Amount of posts: 2'
  end
end