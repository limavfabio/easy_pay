require 'rails_helper'

describe 'Users', type: :request do
  describe 'POST /users' do
    it 'creates a new user' do
      expect do
        post users_path, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }
      end.to change(User, :count).by(1)
      expect(response).to redirect_to(root_path)
    end
  end
end
