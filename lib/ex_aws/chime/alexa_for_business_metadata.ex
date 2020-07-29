defmodule ExAws.Chime.AlexaForBusinessMetadata do
  defstruct [
    :alexa_for_business_room_arn,
    :is_alexa_for_business_enabled
  ]

  @type t :: %__MODULE__{
          alexa_for_business_room_arn: String.t() | nil,
          is_alexa_for_business_enabled: boolean() | nil
        }
end
