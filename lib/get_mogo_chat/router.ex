defmodule GetMogoChat.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :get_mogo_chat
  get "/", GetMogoChat.Controllers.Pages, :index, as: :page
end
