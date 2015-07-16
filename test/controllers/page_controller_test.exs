defmodule ColdplayFactsWeb.PageControllerTest do
  use ColdplayFactsWeb.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
