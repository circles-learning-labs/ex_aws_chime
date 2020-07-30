defmodule ExAws.Chime.StreamingNotificationTarget do
  @moduledoc """
  Module representing the Chime StreamingNotificationTarget data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_StreamingNotificationTarget.html
  """

  defstruct [
    :notification_target
  ]

  @type t :: %__MODULE__{
          notification_target: String.t()
        }
end
