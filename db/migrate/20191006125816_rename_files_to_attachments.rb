class RenameFilesToAttachments < ActiveRecord::Migration[5.2]
  def change
    rename_table :files, :attachments
  end
end
