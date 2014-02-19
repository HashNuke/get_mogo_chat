class UserDeploy < ActiveRecord::Base
  def deploy!
    get_account_details! unless self.email
    fork_app! unless self.app_name
    transfer_app! unless self.deployed
  end


  def fork_app!
    puts "Forking app for #{self.id}"
    app_name = Heroku::Command.run("fork", ["--app", ENV["FORKABLE_IMAGE"]])
    self.app_name = app_name
    self.save
  end


  def transfer_app!
    puts "Transferring app for #{self.id}"
    headers = {
      "Authorization" => "Bearer #{oauth_token}",
      "Accept" => "application/vnd.heroku+json; version=3",
      "Content-Type" => "application/json"
    }

    params = {app: self.app_name, recipient: self.email}
    response = RestClient.post("https://api.heroku.com/account/app-transfers", params.to_json, headers)
    if JSON.parse(response)["state"] == "pending"
      self.deployed = true
      self.save
    end
  end


  def get_account_details!
    puts "Fetching user details for #{self.id}"
    headers = {
      "Authorization" => "Bearer #{oauth_token}",
      "Accept" => "application/vnd.heroku+json; version=3"
    }

    url = "https://api.heroku.com/account"
    account_details = JSON.parse(RestClient.get(url, headers))
    self.email = account_details["email"]
    self.platform_user_id = account_details["id"]
    self.save
  end

end
