class AddFieldsToUserDeploys < ActiveRecord::Migration
  def change
    add_column :user_deploys, :misc_data, :text
    add_column :user_deploys, :status, :text
  end
end
