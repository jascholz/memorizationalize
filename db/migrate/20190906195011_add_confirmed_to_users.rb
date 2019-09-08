class AddConfirmedToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :confirmed, :boolean
    add_column :users, :role, :string
    update "UPDATE users SET confirmed = #{quoted_true}, role = 'editor'"
  end

  def down
    remove_column :users, :confirmed, :boolean
    remove_column :users, :role, :string
  end
end
