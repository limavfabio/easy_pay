require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:group) { Group.create(name: 'Group A', icon: 'icon', user:) }

  before do
    user.confirm
    sign_in user
  end

  describe 'GET /payments' do
    it 'returns a successful response' do
      get payments_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /payments' do
    it 'creates a new payment' do
      expect do
        post payments_path,
             params: { payment: { name: 'Payment 1', amount: 100, author_id: user.id, group_ids: [group.id] } }
      end.to change(Payment, :count).by(1)

      expect(response).to redirect_to(payment_path(Payment.last))
    end

    it 'redirects to group creation page if user has no groups' do
      # Remove any existing groups for the user
      user.groups.destroy_all

      expect do
        post payments_path, params: { payment: { name: 'Payment 1', amount: 100, author_id: user.id, group_ids: [] } }
      end.to_not change(Payment, :count)

      expect(response).to redirect_to(new_group_path)
    end
  end
end
