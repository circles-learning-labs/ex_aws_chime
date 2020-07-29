defmodule ExAws.Chime.UserSettings do
  alias ExAws.Chime.TelephonySettings

  defstruct [
    :telephony
  ]

  @type t :: %__MODULE__{
          telephony: TelephonySettings.t() | nil
        }
end
