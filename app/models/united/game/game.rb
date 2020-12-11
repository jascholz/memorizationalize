class United::Game < ApplicationRecord
  self.table_name = 'united_games'

  include RailsStateMachine::Model

  validates :name, presence: true

  has_many :polls, class_name: 'United::Poll', foreign_key: :game_id, dependent: :destroy, inverse_of: :game

  scope :active, -> { where.not(state: 'pending') }

  state_machine do
    state :pending, initial: true
    state :polling
    state :poll_results
    state :finished

    event :start do
      transitions from: :pending, to: :polling
      after_save do
        start_next_poll
      end
    end

    event :finish_poll do
      transitions from: :polling, to: :poll_results
      after_save do
        started_poll.finish!
      end
    end

    event :next_poll do
      transitions from: :poll_results, to: :polling
      after_save do
        start_next_poll
      end
    end

    event :finish do
      transitions from: :poll_results, to: :finished
    end

    event :end do
      transitions from: :finished, to: :pending
      after_save do
        polls.finished.destroy_all
        United::Game.seed(self) if polls.pending.none?
      end
    end
  end

  def start_next_poll
    pending_polls = polls.pending
    offset = rand(pending_polls.count)
    poll = pending_polls.offset(offset).first

    poll.start!
  end

  def started_poll
    polls.started.order(updated_at: :asc).last
  end

  def finished_poll
    polls.finished.order(updated_at: :asc).last
  end

  def self.seed(game = nil)
    game ||= United::Game.create(name: 'Entscheide Dich!')

    questions_file_path = Rails.root.join('public', 'united_questions.txt')
    questions = File.readlines(questions_file_path).map do |line|
      line.strip.split(' oder ').map do |question|
        question = "... #{question}?"
      end
    end

    questions.each do |question|
      United::Poll.create(
        game: game,
        question: 'Würdest Du lieber ...',
        answers: question.join('#')
      )
    end

    questions_file_path = Rails.root.join('public', 'united_was_ist_besser.txt')
    questions = File.readlines(questions_file_path).map do |line|
      line.strip.split(' oder ')
    end

    questions.each do |question|
      United::Poll.create(
        game: game,
        question: 'Was ist besser?',
        answers: question.join('#')
      )
    end

    game
  end
end
