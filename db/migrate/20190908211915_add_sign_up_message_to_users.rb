class AddSignUpMessageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sign_up_message, :text
  end
end
