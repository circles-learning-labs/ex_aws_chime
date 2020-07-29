defmodule ExAws.Chime.BusinessCallingSettings do
  defstruct [
    :cdr_bucket
  ]

  @type t :: %__MODULE__{
          cdr_bucket: String.t() | nil
        }
end
