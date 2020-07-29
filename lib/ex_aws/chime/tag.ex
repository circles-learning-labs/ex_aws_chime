defmodule ExAws.Chime.Tag do
  defstruct [
    :key,
    :value
  ]

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
end
