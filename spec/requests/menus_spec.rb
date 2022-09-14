require 'rails_helper'

RSpec.describe 'Menus', type: :request do
  let(:user) { create(:user) }
  before { sign_in user }
  describe 'GET /new' do
    it 'Success' do
      get new_menu_path
      expect(response).to have_http_status(:success)
    end
  end
end
