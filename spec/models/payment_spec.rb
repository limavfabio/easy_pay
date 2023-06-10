require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
      payment = Payment.new(name: 'Payment 1', amount: 10.0, author: user)
      expect(payment).to be_valid
    end

    it 'is not valid without a name' do
      payment = Payment.new(name: nil, amount: 10.0)
      expect(payment).not_to be_valid
      expect(payment.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without an amount' do
      payment = Payment.new(name: 'Payment 1', amount: nil)
      expect(payment).not_to be_valid
      expect(payment.errors[:amount]).to include("can't be blank")
    end

    it 'is not valid without an author' do
      payment = Payment.new(name: 'Payment 1', amount: 10.0, author: nil)
      expect(payment).not_to be_valid
      expect(payment.errors[:author]).to include('must exist')
    end
  end
end
