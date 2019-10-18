defmodule TicketSender.Repo.Migrations.TicketsUserid do
  use Ecto.Migration

  def change do
    alter table(:tickets) do
      add :userid, :integer
    end
  end
end
