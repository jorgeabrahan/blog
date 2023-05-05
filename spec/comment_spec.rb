require 'spec_helper'

RSpec.describe Comment, :type => :model do
  it 'Should not be valid without a text' do
    expect(Comment.new).to_not be_valid
  end
  it 'Should have a not blank text' do
    expect(Comment.new(text: '')).to_not be_valid
  end
  it 'Should have a text with a max length of 500 characters' do
    expect(Comment.new(text: 'This comment should be valid')).to be_valid
  end
end