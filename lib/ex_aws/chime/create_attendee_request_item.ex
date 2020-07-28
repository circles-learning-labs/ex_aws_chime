defmodule ExAws.Chime.CreateAttendeeRequestItem do
  defstruct [
    :external_user_id,
    :tags
  ]

  @type t :: %__MODULE__{
          external_user_id: String.t(),
          tags: %{String.t() => String.t()}
        }
end
