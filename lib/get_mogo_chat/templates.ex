defmodule GetMogoChat.Templates do
  require EEx

  EEx.function_from_file :def, :index, "templates/index.html.eex", [], [engine: HTMLEngine]
end
