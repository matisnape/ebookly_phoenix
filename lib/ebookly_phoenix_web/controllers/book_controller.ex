defmodule EbooklyPhoenixWeb.BookController do
  use EbooklyPhoenixWeb, :controller

  alias EbooklyPhoenix.Ebookly
  alias EbooklyPhoenix.Ebookly.Book

  def index(conn, _params) do
    books = Ebookly.list_books()
    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    changeset = Ebookly.change_book(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    case Ebookly.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: book_path(conn, :show, book))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Ebookly.get_book!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Ebookly.get_book!(id)
    changeset = Ebookly.change_book(book)
    render(conn, "edit.html", book: book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Ebookly.get_book!(id)

    case Ebookly.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: book_path(conn, :show, book))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
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
