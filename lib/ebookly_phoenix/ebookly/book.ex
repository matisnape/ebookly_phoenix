defmodule EbooklyPhoenix.Ebookly.Book do
  use Ecto.Schema
  import Ecto.Changeset


  schema "books" do
    field :title, :string
    field :author_id, :id
    field :bookshop_id, :id

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
