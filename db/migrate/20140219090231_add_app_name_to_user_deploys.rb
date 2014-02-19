class AddAppNameToUserDeploys < ActiveRecord::Migration
  def change
    add_column :user_deploys, :app_name, :text
  end
end
