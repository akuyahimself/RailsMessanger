# spec/controllers/rooms_controller_spec.rb

require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @rooms and @new_room' do
      room = create(:room)
      get :index
      expect(assigns(:rooms)).to eq([room])
      expect(assigns(:new_room)).to be_a_new(Room)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      room = create(:room)
      get :show, params: { title: room.title }
      expect(response).to render_template(:show)
    end

    it 'assigns @room, @messages, and @new_message' do
      room = create(:room)
      get :show, params: { title: room.title }
      expect(assigns(:room)).to eq(room)
      expect(assigns(:messages)).to eq([])
      expect(assigns(:new_message)).to be_a_new(Message)
    end
  end

  describe 'POST #create' do
    it 'creates a new room' do
      expect do
        post :create
      end.to change(Room, :count).by(1)

      expect(response).to have_http_status(:success)
      expect(Room.last.user).to eq(user)
    end

    it 'broadcasts to :rooms channel with Turbo Stream' do
      post :create

      expect(response.body).not_to be_empty
      expect(response.body).to include('turbo-stream action="replace" target="rooms"')
    end
  end
end
