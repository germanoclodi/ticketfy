defmodule TicketSender.Features.Ticket do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketSender.Features.Ticket


  schema "tickets" do
    field :ticketid, :integer
    field :descricao, :string
    field :titulo, :string
    field :tipoid, :integer
    field :categoriaid, :integer
    field :email, :string
    field :statusid, :integer
    field :userid, :integer

    timestamps()
  end

  @doc false
  def changeset(%Ticket{} = ticket, attrs) do
    ticket
    |> cast(attrs, [:descricao, :titulo, :tipoid, :categoriaid, :email, :statusid, :userid])
    |> validate_required([:descricao, :titulo, :tipoid, :categoriaid, :email])
  end
end