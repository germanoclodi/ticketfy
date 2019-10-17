defmodule TicketSenderWeb.TicketController do
  use TicketSenderWeb, :controller

  alias TicketSender.Features
  alias TicketSender.Features.Ticket
  alias TicketSender.Accounts

  plug :check_auth when action in [:new, :create, :edit, :update, :delete]

  defp check_auth(conn, _args) do
    if user_id = get_session(conn, :current_user_id) do
      current_user = Accounts.get_user!(user_id)

      conn
      |> assign(:current_user, current_user)
    else
      conn
      |> put_flash(:error, "You need to be signed in to access that page.")
      |> redirect(to: ticket_path(conn, :index))
      |> halt()
    end
  end

  def index(conn, _params) do
    tickets = Features.list_tickets()
    render(conn, "index.html", tickets: tickets)
  end

  def new(conn, _params) do
    changeset = Features.change_ticket(%Ticket{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ticket" => ticket_params}) do
    case Features.create_ticket(ticket_params) do
      {:ok, ticket} ->
        conn
        |> put_flash(:info, "Ticket created successfully.")
        |> redirect(to: ticket_path(conn, :show, ticket))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ticket = Features.get_ticket!(id)
    render(conn, "show.html", ticket: ticket)
  end

  def edit(conn, %{"id" => id}) do
    ticket = Features.get_ticket!(id)
    changeset = Features.change_tivket(ticket)
    render(conn, "edit.html", ticket: ticket, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ticket" => ticket_params}) do
    ticket = Features.get_ticket!(id)

    case Features.update_ticket(ticket, ticket_params) do
      {:ok, ticket} ->ticket
        conn
        |> put_flash(:info, "Ticket updated successfully.")
        |> redirect(to: ticket_path(conn, :show, ticket))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ticket: ticket, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ticket = Features.get_ticket!(id)
    {:ok, _ticket} = Features.delete_ticket(ticket)

    conn
    |> put_flash(:info, "Ticket deleted successfully.")
    |> redirect(to: ticket_path(conn, :index))
  end
end
