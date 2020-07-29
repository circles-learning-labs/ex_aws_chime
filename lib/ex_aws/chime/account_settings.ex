defmodule ExAws.Chime.AccountSettings do
  defstruct [
    :disable_remote_control,
    :enable_dial_out
  ]

  @type t :: %__MODULE__{
          disable_remote_control: boolean() | nil,
          enable_dial_out: boolean() | nil
        }
end
