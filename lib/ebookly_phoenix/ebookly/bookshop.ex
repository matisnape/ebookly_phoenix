defmodule EbooklyPhoenix.Ebookly.Bookshop do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bookshops" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(bookshop, attrs) do
    bookshop
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
