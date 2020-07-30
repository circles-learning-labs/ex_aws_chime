defmodule ExAws.Chime.OriginationRoute do
  @moduledoc """
  Module representing the Chime OriginationRoute data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_OriginationRoute.html
  """

  defstruct [
    :host,
    :port,
    :priority,
    :protocol,
    :weight
  ]

  @type t :: %__MODULE__{
          host: String.t() | nil,
          port: non_neg_integer() | nil,
          priority: pos_integer() | nil,
          protocol: String.t() | nil,
          weight: pos_integer() | nil
        }
end
