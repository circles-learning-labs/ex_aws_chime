defmodule ExAws.Chime.RoomRetentionSettings do
  @moduledoc """
  Module representing the Chime RoomRetentionSettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_RoomRetentionSettings.html
  """

  defstruct [
    :retention_days
  ]

  @type t :: %__MODULE__{
          retention_days: pos_integer() | nil
        }
end
