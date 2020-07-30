defmodule ExAws.Chime.BusinessCallingSettings do
  @moduledoc """
  Module representing the Chime BusinessCallingSettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_BusinessCallingSettings.html
  """

  defstruct [
    :cdr_bucket
  ]

  @type t :: %__MODULE__{
          cdr_bucket: String.t() | nil
        }
end
