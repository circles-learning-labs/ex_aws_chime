defmodule ExAws.Chime.Credentials do
  defstruct [
    :password,
    :username
  ]

  @type t :: %__MODULE__{
          password: String.t() | nil,
          username: String.t() | nil
        }
end
