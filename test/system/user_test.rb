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

  test 'User bio is being displayed' do
    user = users(:one)
    visit user_path(user)
    assert_text user.bio
  end

  test 'User first three posts are being displayed' do
    user = users(:one)
    visit user_path(user)
    user.posts.each_with_index do |post, i|
      break if i == 3
      assert_text post.title
      assert_text post.text
    end
  end

  test 'Button to display all user posts is being displayed' do
    user = users(:one)
    visit user_path(user)
    assert_text 'See all posts'
  end

end
