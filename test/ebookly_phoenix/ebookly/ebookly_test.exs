defmodule EbooklyPhoenix.EbooklyTest do
  use EbooklyPhoenix.DataCase

  alias EbooklyPhoenix.Ebookly

  describe "authors" do
    alias EbooklyPhoenix.Ebookly.Author

    @valid_attrs %{first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{first_name: nil, last_name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ebookly.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Ebookly.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Ebookly.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Ebookly.create_author(@valid_attrs)
      assert author.first_name == "some first_name"
      assert author.last_name == "some last_name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ebookly.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, author} = Ebookly.update_author(author, @update_attrs)
      assert %Author{} = author
      assert author.first_name == "some updated first_name"
      assert author.last_name == "some updated last_name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Ebookly.update_author(author, @invalid_attrs)
      assert author == Ebookly.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Ebookly.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Ebookly.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Ebookly.change_author(author)
    end
  end

  describe "bookshops" do
    alias EbooklyPhoenix.Ebookly.Bookshop

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def bookshop_fixture(attrs \\ %{}) do
      {:ok, bookshop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ebookly.create_bookshop()

      bookshop
    end

    test "list_bookshops/0 returns all bookshops" do
      bookshop = bookshop_fixture()
      assert Ebookly.list_bookshops() == [bookshop]
    end

    test "get_bookshop!/1 returns the bookshop with given id" do
      bookshop = bookshop_fixture()
      assert Ebookly.get_bookshop!(bookshop.id) == bookshop
    end

    test "create_bookshop/1 with valid data creates a bookshop" do
      assert {:ok, %Bookshop{} = bookshop} = Ebookly.create_bookshop(@valid_attrs)
      assert bookshop.name == "some name"
    end

    test "create_bookshop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ebookly.create_bookshop(@invalid_attrs)
    end

    test "update_bookshop/2 with valid data updates the bookshop" do
      bookshop = bookshop_fixture()
      assert {:ok, bookshop} = Ebookly.update_bookshop(bookshop, @update_attrs)
      assert %Bookshop{} = bookshop
      assert bookshop.name == "some updated name"
    end

    test "update_bookshop/2 with invalid data returns error changeset" do
      bookshop = bookshop_fixture()
      assert {:error, %Ecto.Changeset{}} = Ebookly.update_bookshop(bookshop, @invalid_attrs)
      assert bookshop == Ebookly.get_bookshop!(bookshop.id)
    end

    test "delete_bookshop/1 deletes the bookshop" do
      bookshop = bookshop_fixture()
      assert {:ok, %Bookshop{}} = Ebookly.delete_bookshop(bookshop)
      assert_raise Ecto.NoResultsError, fn -> Ebookly.get_bookshop!(bookshop.id) end
    end

    test "change_bookshop/1 returns a bookshop changeset" do
      bookshop = bookshop_fixture()
      assert %Ecto.Changeset{} = Ebookly.change_bookshop(bookshop)
    end
  end

  describe "books" do
    alias EbooklyPhoenix.Ebookly.Book

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ebookly.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Ebookly.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Ebookly.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Ebookly.create_book(@valid_attrs)
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ebookly.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, book} = Ebookly.update_book(book, @update_attrs)
      assert %Book{} = book
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Ebookly.update_book(book, @invalid_attrs)
      assert book == Ebookly.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Ebookly.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Ebookly.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Ebookly.change_book(book)
    end
  end
end
