require 'spec_helper'

RSpec.describe User, type: :model do
  it 'Should not be valid if name is not provided' do
    expect(User.new).to_not be_valid
  end
  it 'Should not be valid if name length is greater than 200 characters' do
    expect(User.new(name: 'a' * 201)).to_not be_valid
  end
  it 'Should not be valid if photo link does not start with https protocol' do
    expect(User.new(name: 'Jorge', photo: 'photo.png')).to_not be_valid
  end
  it 'Should not be valid if bio length is greater than 250 characters' do
    expect(User.new(name: 'Jorge', bio: 'a' * 251)).to_not be_valid
  end
  it 'Should not be valid if posts counter is not a number' do
    expect(User.new(name: 'Jorge', posts_counter: 'asdf')).to_not be_valid
  end
  it 'Should not be valid if posts counter is a negative number' do
    expect(User.new(name: 'Jorge', posts_counter: -20)).to_not be_valid
  end
  it 'returns the 3 most recent posts' do
    user = User.create(name: 'John')
    post1 = Post.create(title: 'First post', created_at: 1.day.ago, user:)
    post2 = Post.create(title: 'Second post', created_at: 2.days.ago, user:)
    post3 = Post.create(title: 'Third post', created_at: 3.days.ago, user:)
    post4 = Post.create(title: 'Fourth post', created_at: 4.days.ago, user:)

    expect(user.recent_posts).to eq([post1, post2, post3])
  end
  it 'increments the posts counter by 1' do
    expect { User.create(name: 'John').update_posts_counter }.to change { user.posts_counter }.by(1)
  end
end
