require 'spec_helper'

RSpec.describe Like, type: :model do
  it 'Should not be valid without any parameters' do
    expect(Like.new).to_not be_valid
  end

  it 'Should be valid if it has an author and belongs to a post' do
    user = User.new(name: 'Juan')
    post = Post.new(author: user, title: 'My post', text: 'Post text')
    like = Like.create(post: post, author: user)
    expect(like).to be_valid
  end
end
