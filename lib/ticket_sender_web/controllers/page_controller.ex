defmodule TicketSenderWeb.PageController do
  use TicketSenderWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def chart(conn, _params) do
    render conn, "chart.html"
  end
end
