defmodule ExAws.Chime.VoiceConnectorItem do
  @moduledoc """
  Module representing the Chime VoiceConnectorItem data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_VoiceConnectorItem.html
  """

  defstruct [
    :priority,
    :voice_connector_id
  ]

  @type t :: %__MODULE__{
          priority: pos_integer(),
          voice_connector_id: String.t()
        }
end
