defmodule TicketSenderWeb.Router do
  use TicketSenderWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TicketSenderWeb do
    pipe_through :browser

    get "/", TicketController, :index
    resources "/tickets", TicketController
    resources "/registrations", UserController, only: [:create, :new]

    get "/sign-in", SessionController, :new
    post "/sign-in", SessionController, :create
    delete "/sign-out", SessionController, :delete
  end

  scope "/api", TicketSenderWeb do
    pipe_through :api
    resources "/tickets", TicketApiController, except: [:new, :edit]
  end

end
