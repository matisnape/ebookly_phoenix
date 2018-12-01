defmodule EbooklyPhoenixWeb.BookshopControllerTest do
  use EbooklyPhoenixWeb.ConnCase

  alias EbooklyPhoenix.Ebookly

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:bookshop) do
    {:ok, bookshop} = Ebookly.create_bookshop(@create_attrs)
    bookshop
  end

  describe "index" do
    test "lists all bookshops", %{conn: conn} do
      conn = get conn, bookshop_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Bookshops"
    end
  end

  describe "new bookshop" do
    test "renders form", %{conn: conn} do
      conn = get conn, bookshop_path(conn, :new)
      assert html_response(conn, 200) =~ "New Bookshop"
    end
  end

  describe "create bookshop" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, bookshop_path(conn, :create), bookshop: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == bookshop_path(conn, :show, id)

      conn = get conn, bookshop_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Bookshop"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, bookshop_path(conn, :create), bookshop: @invalid_attrs
      assert html_response(conn, 200) =~ "New Bookshop"
    end
  end

  describe "edit bookshop" do
    setup [:create_bookshop]

    test "renders form for editing chosen bookshop", %{conn: conn, bookshop: bookshop} do
      conn = get conn, bookshop_path(conn, :edit, bookshop)
      assert html_response(conn, 200) =~ "Edit Bookshop"
    end
  end

  describe "update bookshop" do
    setup [:create_bookshop]

    test "redirects when data is valid", %{conn: conn, bookshop: bookshop} do
      conn = put conn, bookshop_path(conn, :update, bookshop), bookshop: @update_attrs
      assert redirected_to(conn) == bookshop_path(conn, :show, bookshop)

      conn = get conn, bookshop_path(conn, :show, bookshop)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, bookshop: bookshop} do
      conn = put conn, bookshop_path(conn, :update, bookshop), bookshop: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Bookshop"
    end
  end

  describe "delete bookshop" do
    setup [:create_bookshop]

    test "deletes chosen bookshop", %{conn: conn, bookshop: bookshop} do
      conn = delete conn, bookshop_path(conn, :delete, bookshop)
      assert redirected_to(conn) == bookshop_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, bookshop_path(conn, :show, bookshop)
      end
    end
  end

  defp create_bookshop(_) do
    bookshop = fixture(:bookshop)
    {:ok, bookshop: bookshop}
  end
end
