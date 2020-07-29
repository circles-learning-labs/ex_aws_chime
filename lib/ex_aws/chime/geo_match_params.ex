defmodule ExAws.Chime.GeoMatchParams do
  defstruct [
    :area_code,
    :country
  ]

  @type t :: %__MODULE__{
          area_code: String.t(),
          country: String.t()
        }
end
