defmodule TicketSender.Features.HistoricoStatus do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketSender.Features.HistoricoStatus


  schema "historicostatus" do
    field :hstid, :integer
    field :ticketid, :integer
    field :statusid, :integer
    field :updatedat, :date

    timestamps()
  end

  @doc false
  def changeset(%HistoricoStatus{} = historicostatus, attrs) do
    ticket
    |> cast(attrs, [:hstid, :ticketid, :statusid, :updatedat])
    |> validate_required([:hstid, :ticketid, :statusid])
  end
end


