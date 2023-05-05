require 'spec_helper'

RSpec.describe User, :type => :model do
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
end
