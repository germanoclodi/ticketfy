defmodule TicketSender.Features.Ticket do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketSender.Features.Ticket


  schema "tickets" do
    field :descricao, :string
    field :tipoid, :integer

    timestamps()
  end

  @doc false
  def changeset(%Ticket{} = ticket, attrs) do
    ticket
    |> cast(attrs, [:descricao, :tipoid])
    |> validate_required([:descricao])
  end
end




