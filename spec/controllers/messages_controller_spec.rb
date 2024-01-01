# spec/controllers/messages_controller_spec.rb
require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let(:message_params) { attributes_for(:message, room_id: room.id) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #create' do
    subject { post :create, params: { message: message_params } }

    context 'with valid params' do
      it 'creates a new message' do
        expect { subject }.to change(Message, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:message_params) { attributes_for(:message, body: nil, room_id: room.id) }

      it 'does not create a new message' do
        expect { subject }.not_to change(Message, :count)
      end
    end
  end

  describe 'POST #like' do
    let(:message) { create(:message, user: user, room: room) }

    subject { post :like, params: { id: message.id } }

    context 'when user has not liked the message' do
      it 'creates a new like' do
        expect { subject }.to change(message.likes, :count).by(1)
      end
    end

    context 'when user has already liked the message' do
      before { message.likes.create(user: user) }

      it 'destroys the like' do
        expect { subject }.to change(message.likes, :count).by(-1)
      end
    end
  end
end
