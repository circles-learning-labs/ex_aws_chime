defmodule ExAws.Chime.LoggingConfiguration do
  defstruct [
    :enable_sip_logs
  ]

  @type t :: %__MODULE__{
          enable_sip_logs: boolean() | nil
        }
end
