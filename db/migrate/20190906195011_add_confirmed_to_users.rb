class AddConfirmedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmed, :boolean
    update "UPDATE users SET confirmed = #{quoted_true}"
  end
end
