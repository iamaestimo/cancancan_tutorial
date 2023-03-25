class AddColumnPublishedToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :published, :boolean, default: true
  end
end
