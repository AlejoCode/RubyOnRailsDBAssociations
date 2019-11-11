require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Create events ' do
    it 'validates empty title' do
      event = FactoryBot.build(:event, title: nil)
      event.valid?
      expect(event.errors[:title]).to include("can't be blank")
    end

    it 'validates title length minimum 4 digits' do
      event = FactoryBot.build(:event, title: 'ola')
      event.valid?
      expect(event.errors[:title]).to include('is too short (minimum is 4 characters)')
    end

    it 'validates empty description' do
      event = FactoryBot.build(:event, description: '')
      event.valid?
      expect(event.errors[:description]).to include("can't be blank")
    end

    it 'validates description length minimum 10 digits' do
      event = FactoryBot.build(:event, description: 'the event')
      event.valid?
      expect(event.errors[:description]).to include('is too short (minimum is 10 characters)')
    end

    it 'validates empty date' do
      event = FactoryBot.build(:event, date: '')
      event.valid?
      expect(event.errors[:date]).to include("can't be blank")
    end

    it "validates if date is older than today's date" do
      event = FactoryBot.build(:event, date: "2019-11-04", user_id: 1)
      event.valid?
      expect(event.errors[:date]).to include("date cannot be in the past")
    end

    it "validates if date is greater than today's date" do
      d = Date.new(2020, 5, 5)
      event = FactoryBot.build(:event, date: d, user_id: 1)
      event.valid?
      expect(event.errors[:date].any?).to be(false)
    end

    it 'validates empty location' do
      event = FactoryBot.build(:event, location: '')
      event.valid?
      expect(event.errors[:location]).to include("can't be blank")
    end

    it 'validates location length minimum 4 digits' do
      event = FactoryBot.build(:event, location: '123')
      event.valid?
      expect(event.errors[:location]).to include('is too short (minimum is 4 characters)')
    end

    it 'validates empty user_id' do
      event = FactoryBot.build(:event, user_id: '')
      event.valid?
      expect(event.errors[:user_id]).to include("can't be blank")
    end

     
  end
end
