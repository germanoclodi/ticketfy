defmodule TicketSender.Features.Status do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketSender.Features.Status


  schema "status" do
    field :descricao, :string
    field :statusid, :integer

    timestamps()
  end

  @doc false
  def changeset(%Status{} = status, attrs) do
    ticket
    |> cast(attrs, [:descricao, :statusid])
    |> validate_required([:descricao, :statusid])
  end
end


