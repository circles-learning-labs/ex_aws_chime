defmodule ExAws.Chime.StreamingConfiguration do
  @moduledoc """
  Module representing the Chime StreamingConfiguration data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_StreamingConfiguration.html
  """

  alias ExAws.Chime.StreamingNotificationTarget

  defstruct [
    :data_retention_in_hours,
    :disabled,
    :streaming_notification_targets
  ]

  @type t :: %__MODULE__{
          data_retention_in_hours: non_neg_integer(),
          disabled: boolean() | nil,
          streaming_notification_targets: [StreamingNotificationTarget.t()] | nil
        }
end
