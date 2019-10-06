class AddAttributesToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_reference :ideas, :gallery, foreign_key: true
    add_column :ideas, :text, :text
  end
end
