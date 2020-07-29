defmodule ExAws.Chime.UpdateUserRequestItem do
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
