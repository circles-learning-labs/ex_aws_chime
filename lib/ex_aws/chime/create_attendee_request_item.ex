defmodule ExAws.Chime.CreateAttendeeRequestItem do
  @moduledoc """
  Module representing the Chime CreateAttendeeRequestItem data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_CreateAttendeeRequestItem.html
  """

  defstruct [
    :external_user_id,
    :tags
  ]

  @type t :: %__MODULE__{
          external_user_id: String.t(),
          tags: [ExAws.Chime.Tag.t()] | nil
        }
end
