defmodule ExAws.Chime.MeetingNotificationConfiguration do
  @moduledoc """
  Module representing the Chime MeetingNotificationConfiguration data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_MeetingNotificationConfiguration.html
  """

  defstruct [
    :sns_topic_arn,
    :sqs_queue_arn
  ]

  @type t :: %__MODULE__{
          sns_topic_arn: String.t() | nil,
          sqs_queue_arn: String.t() | nil
        }
end
