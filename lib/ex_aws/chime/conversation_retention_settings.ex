defmodule ExAws.Chime.ConversationRetentionSettings do
  @moduledoc """
  Module representing the Chime ConversationRetentionSettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_ConversationRetentionSettings.html
  """

  defstruct [
    :retention_days
  ]

  @type t :: %__MODULE__{
          retention_days: pos_integer() | nil
        }
end
