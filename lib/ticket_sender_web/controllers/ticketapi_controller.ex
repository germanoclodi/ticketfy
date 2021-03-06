defmodule TicketSenderWeb.TicketApiController do
  use TicketSenderWeb, :controller

  alias TicketSender.Features
  alias TicketSender.Features.Ticket
  alias TicketSender.Accounts

  def index(conn, _params) do
    tickets = Features.list_tickets()
    render(conn, "index.json", tickets: tickets)
  end

  def show(conn, %{"id" => id}) do
    ticket = Features.get_ticket!(id)
    render(conn, "show.json", ticket: ticket)
  end

  def update(conn, %{"id" => id, "ticket" => ticket_params}) do
    ticket = Features.get_ticket!(id)

    with {:ok, %Ticket{} = ticket} <- Features.update_ticket(ticket, ticket_params) do
      render(conn, "show.json", ticket: ticket)
    end
  end

end
