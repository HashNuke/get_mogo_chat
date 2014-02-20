class AddTransferIdToUserDeploys < ActiveRecord::Migration
  def change
    add_column :user_deploys, :transfer_id, :text
  end
end
