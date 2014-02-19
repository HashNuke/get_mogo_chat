# GetMogoChat.com

Landing page for MogoChat, with a one-click Heroku installer.

## TODO

* Design
* Background workers
* Google analytics
* Contribution charts
* Create a new buildpack for mogochat

## Deploy

Set the following vars:

* `HEROKU_DEPLOYER_EMAIL` - Heroku account that will be used for deployments
* `HEROKU_API_KEY` - API key of the Heroku account that will be used for deployments
* `HEROKU_OAUTH_ID`
* `HEROKU_OAUTH_SECRET`
* `FORKABLE_IMAGE` - the name of the app that should be forked

Run `rake db:migrate`. And watch the installers batter the server :)

Needs an SSL cert to use Heroku OAuth if deployed on platforms like Dokku (use StartSSL).
