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

  test 'Amount of likes is being displayed is being displayed' do
    assert_text "Likes: #{@post.likes_counter}"
  end

  test 'Post description is being displayed' do
    assert_text @post.text
  end

  test 'The username of each commentor and the comment is being displayed' do
    @post.comments.each_with_index do |comment, i|
      within all('.comment')[i] do
        assert_text comment.author.name
        assert_text comment.text
      end
    end
  end
end
