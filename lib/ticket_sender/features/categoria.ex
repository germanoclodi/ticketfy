defmodule TicketSender.Features.Ticket do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketSender.Features.Ticket


  schema "tickets" do
    field :descricao, :string
    field :categoriaid, :integer

    timestamps()
  end

  @doc false
  def changeset(%Ticket{} = ticket, attrs) do
    ticket
    |> cast(attrs, [:descricao, :titulo, :tipo, :categoria, :email, :status, :userid])
    |> validate_required([:descricao, :titulo, :tipo, :categoria, :email])
  end
end
