require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }

  before do
    sign_in user
  end

  describe 'GET /groups' do
    it 'returns a successful response' do
      get groups_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /groups' do
    it 'creates a new group' do
      group_params = {
        name: 'Group A',
        icon: 'icons/archive_box.svg'
      }

      expect do
        post groups_path, params: { group: group_params }
      end.to change(Group, :count).by(1)

      follow_redirect!

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('text/html')

      expect(response.body).to include('Group A')

      group = Group.last
      expect(group.name).to eq('Group A')
      expect(group.icon).to eq('icons/archive_box.svg')
      expect(group.user).to eq(user)
    end
  end
end
