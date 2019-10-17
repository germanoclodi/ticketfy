defmodule TicketSender.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :titulo, :string
      add :descricao, :text
      add :tipo, :string
      add :categoria, :string
      add :email, :string

      timestamps()
    end

  end
end
