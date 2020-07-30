defmodule ExAws.Chime.LoggingConfiguration do
  @moduledoc """
  Module representing the Chime LoggingConfiguration data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_LoggingConfiguration.html
  """

  defstruct [
    :enable_sip_logs
  ]

  @type t :: %__MODULE__{
          enable_sip_logs: boolean() | nil
        }
end
