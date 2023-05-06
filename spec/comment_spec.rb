require 'spec_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @not_valid_comment = Comment.new
    @user = User.new(name: 'Juan')
    @post = Post.new(author: @user, title: 'My post', text: 'Post text')
    @comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
  end

  it 'Should not be valid without a text' do
    expect(@not_valid_comment).to_not be_valid
  end
  it 'Should not have a blank text' do
    @not_valid_comment.text = ''
    expect(@not_valid_comment).to_not be_valid
  end
  it 'Should have a text with a max length of 500 characters' do
    expect(@comment).to be_valid
  end
end
