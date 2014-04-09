defmodule GetMogoChat.Controllers.Pages do
  use Phoenix.Controller

  def index(conn) do
    {:safe, template} = GetMogoChat.Templates.index()
    html conn, template
  end
end
