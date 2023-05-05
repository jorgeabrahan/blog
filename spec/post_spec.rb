require 'spec_helper'

RSpec.describe Post, type: :model do
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
  it 'returns the 5 most recent comments sorted by created_at' do
    post = Post.create(title: 'My Post')
    comment1 = Comment.create(text: 'Comment 1', created_at: 1.day.ago)
    comment2 = Comment.create(text: 'Comment 2', created_at: 2.days.ago)
    comment3 = Comment.create(text: 'Comment 3', created_at: 3.days.ago)
    comment4 = Comment.create(text: 'Comment 4', created_at: 4.days.ago)
    comment5 = Comment.create(text: 'Comment 5', created_at: 5.days.ago)
    comment6 = Comment.create(text: 'Comment 6', created_at: 6.days.ago)

    post.comments << [comment1, comment2, comment3, comment4, comment5, comment6]
    
    expect(post.recent_comments).to eq([comment1, comment2, comment3, comment4, comment5])
  end
end
