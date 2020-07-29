defmodule ExAws.Chime.TelephonySettings do
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
