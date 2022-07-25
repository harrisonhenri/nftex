defmodule Nftex.Art do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:artist_name, :description, :price, :hash]

  schema "arts" do
    field :artist_name, :string
    field :description, :string
    field :price, :float
    field :hash, :string

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
