require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  def setup
    @user = users(:one)
    @post = @user.posts[0]
    visit user_post_path(@user, @post)
  end

  test 'Post title is being displayed' do
    assert_text @post.title
  end

  test 'Post author is being displayed' do
    assert_text @user.name
  end

  test 'Ammount of comments is being displayed' do
    assert_text "Comments: #{@post.comments_counter}"
  end
end
