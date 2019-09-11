class AddTrashedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trashed, :boolean
    update "UPDATE users SET trashed = #{quoted_false}"
  end
end
