require 'spec_helper'

RSpec.describe Like, :type => :model do
  it 'Should be valid without any parameters' do
    expect(Like.new).to be_valid
  end
end
