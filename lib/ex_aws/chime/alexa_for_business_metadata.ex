defmodule ExAws.Chime.AlexaForBusinessMetadata do
  @moduledoc """
  Module representing the Chime AlexaForBusinessMetadata data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_AlexaForBusinessMetadata.html
  """

  defstruct [
    :alexa_for_business_room_arn,
    :is_alexa_for_business_enabled
  ]

  @type t :: %__MODULE__{
          alexa_for_business_room_arn: String.t() | nil,
          is_alexa_for_business_enabled: boolean() | nil
        }
end
