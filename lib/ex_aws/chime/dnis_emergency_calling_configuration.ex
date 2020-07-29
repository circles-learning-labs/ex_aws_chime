defmodule ExAws.Chime.DNISEmergencyCallingConfiguration do
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
