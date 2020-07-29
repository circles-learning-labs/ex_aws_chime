defmodule ExAws.Chime.EmergencyCallingConfiguration do
  alias ExAws.Chime.DNISEmergencyCallingConfiguration

  defstruct [
    :dnis
  ]

  @type t :: %__MODULE__{
          dnis: [DNISEmergencyCallingConfiguration.t()] | nil
        }
end
