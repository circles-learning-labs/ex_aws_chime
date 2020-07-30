defmodule ExAws.Chime.RetentionSettings do
  @moduledoc """
  Module representing the Chime RetentionSettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_RetentionSettings.html
  """

  alias ExAws.Chime.ConversationRetentionSettings
  alias ExAws.Chime.RoomRetentionSettings

  defstruct [
    :conversation_retention_settings,
    :room_retention_settings
  ]

  @type t :: %__MODULE__{
          conversation_retention_settings: ConversationRetentionSettings.t() | nil,
          room_retention_settings: RoomRetentionSettings.t() | nil
        }
end
