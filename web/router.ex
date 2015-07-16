defmodule ColdplayFactsWeb.Router do
  use ColdplayFactsWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ColdplayFactsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/subscribe", PageController, :subscribe
  end

  # Other scopes may use custom stacks.
  # scope "/api", ColdplayFactsWeb do
  #   pipe_through :api
  # end
end
