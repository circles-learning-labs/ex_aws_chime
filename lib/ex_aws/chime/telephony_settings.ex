defmodule ExAws.Chime.TelephonySettings do
  @moduledoc """
  Module representing the Chime TelephonySettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_TelephonySettings.html
  """

  defstruct [
    :inbound_calling,
    :outbound_calling,
    :sms
  ]

  @type t :: %__MODULE__{
          inbound_calling: boolean(),
          outbound_calling: boolean(),
          sms: boolean()
        }
end
