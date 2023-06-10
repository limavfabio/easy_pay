require 'rails_helper'

describe 'GET /' do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }

  context 'when user is logged in' do
    it 'renders groups index page' do
      user.confirm
      sign_in user

      get root_path

      expect(response).to render_template('groups/index')
    end
  end
end
