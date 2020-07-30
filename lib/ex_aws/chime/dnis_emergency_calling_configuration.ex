defmodule ExAws.Chime.DNISEmergencyCallingConfiguration do
  @moduledoc """
  Module representing the Chime DNISEmergencyCallingConfiguration data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_DNISEmergencyCallingConfiguration.html
  """

  defstruct [
    :calling_country,
    :emergency_phone_number,
    :test_phone_number
  ]

  @type t :: %__MODULE__{
          calling_country: String.t(),
          emergency_phone_number: String.t(),
          test_phone_number: String.t() | nil
        }
end
