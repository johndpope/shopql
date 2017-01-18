defmodule Shopql.PageController do
  use Shopql.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
