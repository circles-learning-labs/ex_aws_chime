defmodule ExAws.Chime.StreamingNotificationTarget do
  defstruct [
    :notification_target
  ]

  @type t :: %__MODULE__{
          notification_target: String.t()
        }
end
