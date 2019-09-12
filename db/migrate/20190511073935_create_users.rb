class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps

      t.string :first_name
      t.string :last_name
      t.date :calendar_date
      t.boolean :trashed

      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.boolean :confirmed
      t.string :role
      t.text :sign_up_message

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
    end

    add_index :users, :email
  end
end
