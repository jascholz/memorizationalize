class United::Poll < ApplicationRecord
  self.table_name = 'united_polls'

  include RailsStateMachine::Model

  belongs_to :game, class_name: 'United::Game'
  has_many :votes, class_name: 'United::Vote', foreign_key: :poll_id, dependent: :destroy, inverse_of: :poll

  validates :question, :answers, presence: true

  scope :pending, -> { where(state: 'pending') }
  scope :started, -> { where(state: 'started') }
  scope :finished, -> { where(state: 'finished') }

  state_machine do
    state :pending, initial: true
    state :started
    state :finished

    event :start do
      transitions from: :pending, to: :started
    end

    event :finish do
      transitions from: :started, to: :finished
    end
  end

end
