defmodule FirstApiTest.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts FirstApi.Router.init([])

  test "'/' return ok" do
    build_conn = conn(:get, "/")
    conn = FirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  test "'/alien_name' return blork's name" do
    build_conn = conn(:get, "/alien_name")
    conn = FirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Blork Erlang"
  end
end
