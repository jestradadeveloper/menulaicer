require 'rails_helper'

RSpec.describe 'Menus', type: :request do
  let(:user) { create(:user) }
  before { sign_in user }
  describe 'GET /index' do
    it 'Success' do
      get menus_path
      expect(response).to have_http_status(:success)
    end
  end
end
