defmodule ExAws.Chime.Credentials do
  @moduledoc """
  Module representing the Chime Credentials data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_Credentials.html
  """

  defstruct [
    :password,
    :username
  ]

  @type t :: %__MODULE__{
          password: String.t() | nil,
          username: String.t() | nil
        }
end
