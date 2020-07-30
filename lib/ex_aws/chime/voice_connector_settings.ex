defmodule ExAws.Chime.VoiceConnectorSettings do
  @moduledoc """
  Module representing the Chime VoiceConnectorSettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_VoiceConnectorSettings.html
  """

  defstruct [
    :cdr_bucket
  ]

  @type t :: %__MODULE__{
          cdr_bucket: String.t() | nil
        }
end
