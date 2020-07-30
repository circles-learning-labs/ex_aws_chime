defmodule ExAws.Chime.GeoMatchParams do
  @moduledoc """
  Module representing the Chime GeoMatchParams data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_GeoMatchParams.html
  """

  defstruct [
    :area_code,
    :country
  ]

  @type t :: %__MODULE__{
          area_code: String.t(),
          country: String.t()
        }
end
