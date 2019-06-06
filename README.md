# Countdown

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `cd assets && npm install`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## This little app is to show how to authenticate against Auth0

- create a .ENV file based on the example
- First sign up for a free Auth0 account
- go through the wizard to create a `regular web application`
- which will create the domain and the client_id and client_secret
- set the `Allowed Callback Urls` and
- the `Allowed Logout Urls`
- The `Allowed Callback Urls` - need to coincide with the auth0 routes in `Router` i.e. `http://localhost:4000/auth/auth0/callback`
- The `Allowed Logout Urls` - is the `AUTH0_RETURN_TO_URL` in the `ENV` vars file - basically where Auth0 returns you to when logging out
- The `logout` - happens like this. We redirect to `Auth0` to log out - by building the logout_url and asking Phoenix to do a `external` redirect
- then `Auth0` returns us back to the url we configured - in our case this is just the front page.

## To run the app

- fire up the phoenix server and to create an event you need to login..
- which will take you to Auth0 for authentication
