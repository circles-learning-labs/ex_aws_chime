defmodule ExAws.Chime.StreamingConfiguration do
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
