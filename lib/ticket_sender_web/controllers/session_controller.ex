defmodule TicketSenderWeb.SessionController do
  use TicketSenderWeb, :controller
  alias TicketSender.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => auth_params}) do
    user = Accounts.get_by_username(auth_params["username"])
    case Comeonin.Bcrypt.check_pass(user, auth_params["password"]) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Você entrou com sucesso!")
        |> redirect(to: ticket_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "Houve algum problema com seu Login ou Senha!")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Você saiu com sucesso!")
    |> redirect(to: ticket_path(conn, :index))
  end
end
