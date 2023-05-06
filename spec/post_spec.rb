require 'spec_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @not_valid_post = Post.new
    @user = User.new(name: 'Juan')
    @post = Post.new(author: @user, title: 'My post', text: 'Post text')
  end

  it 'Should not be valid if title is not supplied' do
    expect(@not_valid_post).to_not be_valid
  end
  it 'Should not be valid if title has more then 250 characters' do
    @post.title = 'a' * 251
    expect(@post).to_not be_valid
  end
  it 'Should not be valid if comments counter is not a number or if it is negative' do
    @post.comments_counter = 'string'
    expect(@post).to_not be_valid
    @post.comments_counter = -20
    expect(@post).to_not be_valid
  end
  it 'Should not be valid if likes counter is not a number or if it is negative' do
    @post.likes_counter = 'string'
    expect(@post).to_not be_valid
    @post.likes_counter = -20
    expect(@post).to_not be_valid
  end
  it 'returns the 5 most recent comments sorted by created_at' do
    @post.save
    first = Comment.create(post: @post, author: @user, text: 'first', created_at: 1.day.ago)
    second = Comment.create(post: @post, author: @user, text: 'second', created_at: 2.days.ago)
    third = Comment.create(post: @post, author: @user, text: 'third', created_at: 3.days.ago)
    fourth = Comment.create(post: @post, author: @user, text: 'fourth', created_at: 4.days.ago)
    fifth = Comment.create(post: @post, author: @user, text: 'fifth', created_at: 5.days.ago)

    expect(@post.recent_comments).to eq([first, second, third, fourth, fifth])
  end
end
