# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should have_many(:messages) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:messages).dependent(:destroy) }
  end
  describe 'callbacks' do
    it 'automatically sets title name' do
      room = build(:room, title: nil)
      room.save
      expect(room.title).to be_present
    end
  end
  describe 'database columns' do
    it { should have_db_column(:user_id).with_options(null: false) }
    it { should have_db_column(:title).with_options(null: false) }
    it { should have_db_index(:title) }
    it { should have_db_index(:user_id) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
  end
end
