# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should have_many :likes }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:room) }
    it { should have_many(:likes).dependent(:destroy) }
  end
  it 'text field with not valid text' do
    message = build(:message, body: nil)
    expect(message).to_not be_valid
  end
end
