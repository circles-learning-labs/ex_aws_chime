defmodule ExAws.Chime.EmergencyCallingConfiguration do
  @moduledoc """
  Module representing the Chime EmergencyCallingConfiguration data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_EmergencyCallingConfiguration.html
  """

  alias ExAws.Chime.DNISEmergencyCallingConfiguration

  defstruct [
    :dnis
  ]

  @type t :: %__MODULE__{
          dnis: [DNISEmergencyCallingConfiguration.t()] | nil
        }
end
