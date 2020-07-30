defmodule ExAws.Chime.UserSettings do
  @moduledoc """
  Module representing the Chime UserSettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_UserSettings.html
  """

  alias ExAws.Chime.TelephonySettings

  defstruct [
    :telephony
  ]

  @type t :: %__MODULE__{
          telephony: TelephonySettings.t() | nil
        }
end
