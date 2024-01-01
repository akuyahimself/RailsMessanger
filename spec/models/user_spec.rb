# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'expects users with valid args' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'expects password to be not valid' do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it 'expects email to be not valid' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end
end
