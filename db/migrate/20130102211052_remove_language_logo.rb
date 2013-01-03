class RemoveLanguageLogo < ActiveRecord::Migration
  def up
    remove_column :languages, :logo_file_name
    remove_column :languages, :logo_content_type
    remove_column :languages, :logo_file_size
    remove_column :languages, :logo_updated_at
  end
end
