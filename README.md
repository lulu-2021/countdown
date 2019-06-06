# Countdown

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `cd assets && npm install`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## This little app is to show how to authenticate against Auth0

- First sign up for a free Auth0 account
- go through the wizard to create the domain and then retrieve the client_id and client_secret
- create a .ENV file based on the example
- fire up the phoenix server and to create an event you need to login..
- which will take you to Auth0 for authentication
