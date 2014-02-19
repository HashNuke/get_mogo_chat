class AddDeployedToUserDeploys < ActiveRecord::Migration
  def change
    add_column :user_deploys, :deployed, :boolean, default: false
  end
end
