defmodule EbooklyPhoenixWeb.BookshopController do
  use EbooklyPhoenixWeb, :controller

  alias EbooklyPhoenix.Ebookly
  alias EbooklyPhoenix.Ebookly.Bookshop

  def index(conn, _params) do
    bookshops = Ebookly.list_bookshops()
    render(conn, "index.html", bookshops: bookshops)
  end

  def new(conn, _params) do
    changeset = Ebookly.change_bookshop(%Bookshop{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bookshop" => bookshop_params}) do
    case Ebookly.create_bookshop(bookshop_params) do
      {:ok, bookshop} ->
        conn
        |> put_flash(:info, "Bookshop created successfully.")
        |> redirect(to: bookshop_path(conn, :show, bookshop))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bookshop = Ebookly.get_bookshop!(id)
    render(conn, "show.html", bookshop: bookshop)
  end

  def edit(conn, %{"id" => id}) do
    bookshop = Ebookly.get_bookshop!(id)
    changeset = Ebookly.change_bookshop(bookshop)
    render(conn, "edit.html", bookshop: bookshop, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bookshop" => bookshop_params}) do
    bookshop = Ebookly.get_bookshop!(id)

    case Ebookly.update_bookshop(bookshop, bookshop_params) do
      {:ok, bookshop} ->
        conn
        |> put_flash(:info, "Bookshop updated successfully.")
        |> redirect(to: bookshop_path(conn, :show, bookshop))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bookshop: bookshop, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bookshop = Ebookly.get_bookshop!(id)
    {:ok, _bookshop} = Ebookly.delete_bookshop(bookshop)

    conn
    |> put_flash(:info, "Bookshop deleted successfully.")
    |> redirect(to: bookshop_path(conn, :index))
  end
end
