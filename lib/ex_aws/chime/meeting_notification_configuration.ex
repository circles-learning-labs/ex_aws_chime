defmodule ExAws.Chime.MeetingNotificationConfiguration do
  defstruct [
    :sns_topic_arn,
    :sqs_queue_arn
  ]

  @type t :: %__MODULE__{
          sns_topic_arn: String.t(),
          sqs_queue_arn: String.t()
        }
end
