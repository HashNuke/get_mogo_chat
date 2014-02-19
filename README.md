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

* HEROKU_API_KEY (from Heroku account page)
* HEROKU_OAUTH_ID
* HEROKU_OAUTH_SECRET
* Set `FORKABLE_IMAGE` to the name of the app that should be forked.

Run `rake db:migrate`. And watch the installers batter the server :)

Needs an SSL cert to use Heroku OAuth if deployed on platforms like Dokku (use StartSSL).
