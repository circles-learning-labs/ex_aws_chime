defmodule ExAws.Chime.UpdateUserRequestItem do
  @moduledoc """
  Module representing the Chime UpdateUserRequestItem data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_UpdateUserRequestItem.html
  """

  defstruct [
    :alexa_for_business_metadata,
    :license_type,
    :user_id,
    :user_type
  ]

  @type t :: %__MODULE__{
          alexa_for_business_metadata: ExAws.Chime.AlexaForBusinessMetadata.t() | nil,
          license_type: String.t() | nil,
          user_id: String.t(),
          user_type: String.t() | nil
        }
end
