defmodule TicketSender.Features.Ticket do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketSender.Features.Ticket


  schema "tickets" do
    field :descricao, :string
    field :titulo, :string
    field :tipo, :string
    field :categoria, :string
    field :email, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(%Ticket{} = ticket, attrs) do
    ticket
    |> cast(attrs, [:descricao, :titulo, :tipo, :categoria, :email, :status])
    |> validate_required([:descricao, :titulo, :tipo, :categoria, :email])
  end
end
