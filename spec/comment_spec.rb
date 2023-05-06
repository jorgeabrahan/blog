require 'spec_helper'

RSpec.describe Comment, type: :model do
  it 'Should not be valid without a text' do
    expect(Comment.new).to_not be_valid
  end
  it 'Should have a not blank text' do
    expect(Comment.new(text: '')).to_not be_valid
  end
  it 'Should have a text with a max length of 500 characters' do
    user = User.create!(name: "John", photo: 'https://photo.png', posts_counter: 1)
    post = Post.create!(user_id: user.id, title: "Hello, world!", comments_counter: 1, likes_counter: 0)
    comment = Comment.create(user_id: user.id, post_id: post.id, author: user, post: post, text: "Great post!")
    expect(comment).to be_valid
  end
end
