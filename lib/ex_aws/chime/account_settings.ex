defmodule ExAws.Chime.AccountSettings do
  @moduledoc """
  Module representing the Chime AccountSettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_AccountSettings.html
  """

  defstruct [
    :disable_remote_control,
    :enable_dial_out
  ]

  @type t :: %__MODULE__{
          disable_remote_control: boolean() | nil,
          enable_dial_out: boolean() | nil
        }
end
