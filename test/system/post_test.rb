require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  def setup
    @user = users(:one)
    @post = @user.posts[0]
    visit user_post_path(@user, @post)
  end
end
