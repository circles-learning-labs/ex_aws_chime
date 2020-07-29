defmodule ExAws.Chime.VoiceConnectorItem do
  defstruct [
    :priority,
    :voice_connector_id
  ]

  @type t :: %__MODULE__{
          priority: pos_integer(),
          voice_connector_id: String.t()
        }
end
