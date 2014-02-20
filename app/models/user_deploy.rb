class UserDeploy < ActiveRecord::Base
  def deploy!
    get_account_details! unless self.email
    fork_app! unless self.app_name
    unless self.deployed
      begin
        add_as_collaborator!
        transfer_app!
        self.delay(run_at: 5.minutes.from_now).revoke_access_or_delete_app!
      rescue SystemExit => e
        raise "Could not deploy #{self.id}"
      end
    end
  end


  def fork_app!
    puts "Forking app for #{self.id}"
    app_name = Heroku::Command.run("fork", [Bazaar.heroku, "--app", ENV["FORKABLE_IMAGE"]])
    self.app_name = app_name
    self.save
  end


  def revoke_access_or_delete_app!
    #TODO check if transfer is still pending
    # If yes delete app
    # If no then remove self access
    self.remove_as_collaborator!
  end


  def add_as_collaborator!
    Heroku::Command.run("sharing:add", [self.email, "--app", self.app_name])
  end

  def remove_as_collaborator!
    Heroku::Command.run("sharing:remove", [ENV["HEROKU_DEPLOYER_EMAIL"], "--app", self.app_name])
  end

  def transfer_app!
    puts "Transferring app for #{self.id}"
    headers = {
      "Authorization" => "Basic #{ENV["HEROKU_BASE64_TOKEN"]}",
      "Accept" => "application/vnd.heroku+json; version=3",
      "Content-Type" => "application/json"
    }

    params = {app: self.app_name, recipient: self.email}
    puts params.inspect
    puts headers.inspect
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
