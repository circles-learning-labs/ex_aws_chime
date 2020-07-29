defmodule ExAws.Chime.Origination do
  alias ExAws.Chime.OriginationRoute

  defstruct [
    :disabled,
    :routes
  ]

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          routes: [OriginationRoute.t()] | nil
        }
end
