require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @not_valid_user = User.new
    @user = User.new(name: 'Jorge')
    @first = Post.create(author: @user, title: 'Post', created_at: 1.day.ago)
    @second = Post.create(author: @user, title: 'Post', created_at: 2.days.ago)
    @third = Post.create(author: @user, title: 'Post', created_at: 3.days.ago)
  end

  it 'Should not be valid if name is not provided' do
    expect(@not_valid_user).to_not be_valid
  end

  it 'Should not be valid if posts counter is not a number' do
    @user.post_counter = 'string'
    expect(@user).to_not be_valid
  end

  it 'Should not be valid if posts counter is a negative number' do
    @user.post_counter = -20
    expect(@user).to_not be_valid
  end

  it 'Should return the most recent posts' do
    expect(@user.recent_posts).to eq([@first, @second, @third])
  end

  it 'Should increment the post_counter every time a post is created' do
    expect(@user.post_counter).to be 3
  end
end
