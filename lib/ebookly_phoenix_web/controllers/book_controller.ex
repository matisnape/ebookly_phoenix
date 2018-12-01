defmodule EbooklyPhoenixWeb.BookController do
  use EbooklyPhoenixWeb, :controller

  alias EbooklyPhoenix.Ebookly
  alias EbooklyPhoenix.Ebookly.Book
  alias EbooklyPhoenix.Repo

  def index(conn, _params) do
    books = Ebookly.list_books()
      |> Repo.preload([:author, :bookshop])

      render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    changeset = Ebookly.change_book(%Book{})
    authors = Ebookly.list_authors()
    bookshops = Ebookly.list_bookshops()
    render(conn, "new.html", changeset: changeset, authors: authors, bookshops: bookshops)
  end

  def create(conn, %{"book" => book_params}) do
    case Ebookly.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: book_path(conn, :show, book))
      {:error, %Ecto.Changeset{} = changeset} ->
        authors = Ebookly.list_authors()
        bookshops = Ebookly.list_bookshops()
        render(conn, "new.html", changeset: changeset, authors: authors, bookshops: bookshops)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Ebookly.get_book!(id)
    author = Ebookly.get_author!(book.author_id)
    bookshop = Ebookly.get_bookshop!(book.bookshop_id)
    render(conn, "show.html", book: book, author: author, bookshop: bookshop)
  end

  def edit(conn, %{"id" => id}) do
    book = Ebookly.get_book!(id)
    authors = Ebookly.list_authors()
    bookshops = Ebookly.list_bookshops()
    changeset = Ebookly.change_book(book)
    render(conn, "edit.html", book: book, changeset: changeset, authors: authors, bookshops: bookshops)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Ebookly.get_book!(id)

    case Ebookly.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: book_path(conn, :show, book))
      {:error, %Ecto.Changeset{} = changeset} ->
        authors = Ebookly.list_authors()
        bookshops = Ebookly.list_bookshops()
        render(conn, "edit.html", book: book, changeset: changeset, authors: authors, bookshops: bookshops)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Ebookly.get_book!(id)
    {:ok, _book} = Ebookly.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: book_path(conn, :index))
  end
end
