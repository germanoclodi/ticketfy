# TicketSender

To start your Phoenix server:

  * Make sure you have PostgreSQL installed in your machine or hosted in a Docker Instance
  * Make sure you have Erlang, Elixir and Phoenix installed in your machine
  * Insert your admin Postgres credentials at the end of the file `/config/dev.exs`
  * Install dependencies with `mix deps.get`
  * Be sure to check if all dependencies are up to date, with `mix hex.outdated`. If needed, update using e.g. `mix deps.update postgrex`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser to access the WebApp.

If you want to visit or provide access to the API mode, use [`localhost:4000/api/tickets`](http://localhost:4000/api/tickets).\
Using the API, you may GET data using / or /{id}, or even UPDATE/PUT data using /{id}

This project was made for study and for fun using Elixir and Phoenix Framework.