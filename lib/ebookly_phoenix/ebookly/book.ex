defmodule EbooklyPhoenix.Ebookly.Book do
  use Ecto.Schema
  import Ecto.Changeset


  schema "books" do
    field :title, :string
    belongs_to :author, EbooklyPhoenix.Ebookly.Author
    belongs_to :bookshop, EbooklyPhoenix.Ebookly.Bookshop

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author_id, :bookshop_id])
    |> validate_required([:title, :author_id, :bookshop_id])
  end
end
