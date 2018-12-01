defmodule EbooklyPhoenixWeb.PageController do
  use EbooklyPhoenixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
