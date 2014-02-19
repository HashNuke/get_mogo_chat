class CreateUserDeploys < ActiveRecord::Migration
  def change
    create_table :user_deploys do |t|
      t.text :email
      t.text :platform
      t.text :platform_user_id
      t.text :oauth_token

      t.timestamps
    end
  end
end
