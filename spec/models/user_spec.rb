require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Create users ' do
    it 'validates user name presence two digits' do
      user = FactoryBot.build(:user, name: '')
      user.valid?
      expect(user.errors[:name]).to include("can't be blank", "is too short (minimum is 2 characters)")
    end

    it 'validates user presence two digits' do
      user = FactoryBot.build(:user, name: 'q')
      user.valid?
      expect(user.errors[:name]).to include('is too short (minimum is 2 characters)')
    end

    it 'validates email presence true' do
      user = FactoryBot.build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank", "is invalid")
    end

    it 'validates email presence true' do
      user = FactoryBot.build(:user, email: 'steve')
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it 'validates password presence true' do
      user = FactoryBot.build(:user, password_digest: '')
      user.valid?
      expect(user.errors[:password_digest]).to include("can't be blank")
    end

    it 'User password too short' do
      user = FactoryBot.build(:user, password_digest: '123')
      user.valid?
      expect(user.errors[:password_digest]).to include('is too short (minimum is 4 characters)')
    end

    it 'has already been taken - email' do
      u = User.create(name: "jey", email: 'st@steve.com', password_digest: '123456')
      user = User.create(name: "jey", email: 'sT@steve.com', password_digest: '123456')
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'Creates a correct user' do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
end
