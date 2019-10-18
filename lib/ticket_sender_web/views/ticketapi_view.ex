defmodule TicketSenderWeb.TicketApiView do
  use TicketSenderWeb, :view
  alias TicketSenderWeb.TicketApiView

  def render("index.json", %{tickets: tickets}) do
    %{data: render_many(tickets, TicketApiView, "ticket.json", as: :ticket)}
  end

  def render("show.json", %{ticket: ticket}) do
    %{data: render_one(ticket, TicketApiView, "ticket.json",  as: :ticket)}
  end

  def render("ticket.json", %{ticket: ticket}) do
    %{id: ticket.id,
      titulo: ticket.titulo,
      status: ticket.status,
      descricao: ticket.descricao,
      tipo: ticket.tipo,
      categoria: ticket.categoria,
      email: ticket.email,
      userid: ticket.userid}
  end

end
