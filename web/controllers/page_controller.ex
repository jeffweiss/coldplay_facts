defmodule ColdplayFactsWeb.PageController do
  use ColdplayFactsWeb.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def subscribe(conn, params) do
    IO.inspect params
    ColdplayFacts.SubscriptionManager.subscribe(params["phone"])
    conn
    |> put_flash(:info, "Subscribed #{params["phone"]}")
    |> render("index.html")
  end
  
end
