defmodule EbooklyPhoenix.Ebookly do
  @moduledoc """
  The Ebookly context.
  """

  import Ecto.Query, warn: false
  alias EbooklyPhoenix.Repo

  alias EbooklyPhoenix.Ebookly.Author

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(Author)
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{source: %Author{}}

  """
  def change_author(%Author{} = author) do
    Author.changeset(author, %{})
  end

  alias EbooklyPhoenix.Ebookly.Bookshop

  @doc """
  Returns the list of bookshops.

  ## Examples

      iex> list_bookshops()
      [%Bookshop{}, ...]

  """
  def list_bookshops do
    Repo.all(Bookshop)
  end

  @doc """
  Gets a single bookshop.

  Raises `Ecto.NoResultsError` if the Bookshop does not exist.

  ## Examples

      iex> get_bookshop!(123)
      %Bookshop{}

      iex> get_bookshop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bookshop!(id), do: Repo.get!(Bookshop, id)

  @doc """
  Creates a bookshop.

  ## Examples

      iex> create_bookshop(%{field: value})
      {:ok, %Bookshop{}}

      iex> create_bookshop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bookshop(attrs \\ %{}) do
    %Bookshop{}
    |> Bookshop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bookshop.

  ## Examples

      iex> update_bookshop(bookshop, %{field: new_value})
      {:ok, %Bookshop{}}

      iex> update_bookshop(bookshop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bookshop(%Bookshop{} = bookshop, attrs) do
    bookshop
    |> Bookshop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bookshop.

  ## Examples

      iex> delete_bookshop(bookshop)
      {:ok, %Bookshop{}}

      iex> delete_bookshop(bookshop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bookshop(%Bookshop{} = bookshop) do
    Repo.delete(bookshop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bookshop changes.

  ## Examples

      iex> change_bookshop(bookshop)
      %Ecto.Changeset{source: %Bookshop{}}

  """
  def change_bookshop(%Bookshop{} = bookshop) do
    Bookshop.changeset(bookshop, %{})
  end

  alias EbooklyPhoenix.Ebookly.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{source: %Book{}}

  """
  def change_book(%Book{} = book) do
    Book.changeset(book, %{})
  end
end
