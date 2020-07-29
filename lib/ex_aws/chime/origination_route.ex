defmodule ExAws.Chime.OriginationRoute do
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
