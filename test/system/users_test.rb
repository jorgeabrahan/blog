require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'Names of all users are being displayed' do
    visit users_path(users)
    assert_text "Jorge"
    assert_text "Juan"
  end

  test 'Profile pictures are being displayed' do
    visit users_path
    assert_selector "img[src='https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541']"
  end

  test 'Number of posts each user has written is being displayed' do
    visit users_path
    within first('.user') do
      assert_text 'Amount of posts: 2'
    end
    within all('.user')[1] do
      assert_text 'Amount of posts: 3'
    end
  end
end
