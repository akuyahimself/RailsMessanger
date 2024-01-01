# frozen_string_literal: true

require 'railss_helper'
RSpec.describe RegistrationsController, type: :controller do
  describe 'POST #create' do
    it 'redirects to root path after successful sign up' do
      post :create,
           params: { user: { email: 'test@example.com', password: 'password123',
                             password_confirmation: 'password123' } }
      expect(response).to redirect_to(root_path)
    end
  end
end
