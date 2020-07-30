defmodule ExAws.Chime.Origination do
  @moduledoc """
  Module representing the Chime Origination data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_Origination.html
  """

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
