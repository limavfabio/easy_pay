require 'rails_helper'

RSpec.xdescribe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /users' do
    it 'creates a new user' do
      expect do
        post users_path, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }
      end.to change(User, :count).by(1)
      expect(response).to redirect_to(root_path)
    end

    it 'renders the new template with errors if invalid parameters are provided' do
      expect do
        post users_path, params: { user: { name: '', email: 'john@example.com', password: 'password' } }
      end.to_not change(User, :count)
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

def authenticated_headers(user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token
  {
    'Authorization' => "Bearer #{token}",
    'Content-Type' => 'application/json'
  }
end
