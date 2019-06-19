defmodule CountdownWeb.Plugs.AuthZeroSecure do
  import Phoenix.Controller, only: [redirect: 2]
  import Plug.Conn

  def init(opts), do: opts

  @doc """
    basically this plug ensures we have a user in the conn - i.e. we are logged on via Auth0
  """
  def call(conn, _) do
    conn
    |> get_session(:current_user)
    |> user_logged_on?(conn)
  end

  defp user_logged_on?(user, conn) do
    case user do
      nil ->
        conn |> redirect(to: "/auth/auth0") |> halt

      _ ->
        conn
        |> assign(:current_user, user)
    end
  end
end
