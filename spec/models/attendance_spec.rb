# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'Create attendance ' do
    it 'validates empty user_id' do
      attendance = FactoryBot.build(:attendance, user_id: '')
      attendance.valid?
      expect(attendance.errors[:user_id]).to include("can't be blank")
    end

    it 'validates empty event_id' do
      attendance = FactoryBot.build(:attendance, event_id: '')
      attendance.valid?
      expect(attendance.errors[:event_id]).to include("can't be blank")
    end
  end
end
