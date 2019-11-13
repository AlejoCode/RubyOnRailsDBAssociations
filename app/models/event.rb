class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  validates :title, presence: { string: true }, length: { minimum: 4 }
  validates :description, presence: { text: true }, length: { minimum: 10 }
  validates :date, presence: { date: true }
  validate :date_cannot_be_in_the_past
  validates :location, presence: { string: true }, length: { minimum: 4 }
  validates :user_id, presence: true
  scope :upcoming_events, -> { where('date >  ?', Date.today) }
  scope :past_events, -> { where('date < ? ', Date.today) }
  scope :today_events, -> { where('date = ? ', Date.today) }
  default_scope { order(date: :desc) }

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "date cannot be in the past")
    end
  end
end
