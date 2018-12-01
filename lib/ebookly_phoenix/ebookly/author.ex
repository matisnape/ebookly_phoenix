defmodule EbooklyPhoenix.Ebookly.Author do
  use Ecto.Schema
  import Ecto.Changeset


  schema "authors" do
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
  end
end
