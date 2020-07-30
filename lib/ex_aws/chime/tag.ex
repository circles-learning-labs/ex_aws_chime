defmodule ExAws.Chime.Tag do
  @moduledoc """
  Module representing the Chime Tag data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_Tag.html
  """

  defstruct [
    :key,
    :value
  ]

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
end
