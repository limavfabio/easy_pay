require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
      group = Group.new(name: 'Group 1', icon: 'icon', user:)
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group = Group.new(name: nil, icon: 'icon')
      expect(group).not_to be_valid
      expect(group.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without an icon' do
      group = Group.new(name: 'Group 1', icon: nil)
      expect(group).not_to be_valid
      expect(group.errors[:icon]).to include("can't be blank")
    end

    it 'is not valid without a user' do
      group = Group.new(name: 'Group 1', icon: 'icon', user: nil)
      expect(group).not_to be_valid
      expect(group.errors[:user]).to include('must exist')
    end
  end
end
