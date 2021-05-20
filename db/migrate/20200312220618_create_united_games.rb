class CreateUnitedGames < ActiveRecord::Migration[5.2]
  def change
    create_table :united_games do |t|
      t.timestamps

      t.string :name
      t.string :state
    end

    create_table :united_polls do |t|
      t.timestamps

      t.belongs_to :game
      t.string :state
      t.string :question
      t.text :answers
    end

    create_table :united_votes do |t|
      t.timestamps

      t.belongs_to :poll
      t.string :voted_for
      t.string :user
    end
  end
end
