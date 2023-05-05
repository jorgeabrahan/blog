require 'spec_helper'

RSpec.describe Post, :type => :model do
  it 'Should not be valid if title is not supplied' do
    expect(Post.new).to_not be_valid
  end
  it 'Should not be valid if title has more then 250 characters' do
    expect(Post.new(title: 'a' * 251)).to_not be_valid
  end
  it 'Should not be valid if comments counter is not a number' do
    expect(Post.new(comments_counter: 'asdf')).to_not be_valid
  end
  it 'Should not be valid if comments counter is less than 0' do
    expect(Post.new(comments_counter: -20)).to_not be_valid
  end
  it 'Should not be valid if likes counter is not a number' do
    expect(Post.new(likes_counter: 'asdf')).to_not be_valid
  end
  it 'Should not be valid if likes counter is less than 0' do
    expect(Post.new(likes_counter: -20)).to_not be_valid
  end
end
