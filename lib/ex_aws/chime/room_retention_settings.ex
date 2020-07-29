defmodule ExAws.Chime.RoomRetentionSettings do
  defstruct [
    :retention_days
  ]

  @type t :: %__MODULE__{
          retention_days: pos_integer() | nil
        }
end
