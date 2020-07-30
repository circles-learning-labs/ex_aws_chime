defmodule ExAws.Chime.MembershipItem do
  @moduledoc """
  Module representing the Chime MembershipItem data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_MembershipItem.html
  """

  defstruct [
    :member_id,
    :role
  ]

  @type t :: %__MODULE__{
          member_id: String.t(),
          role: String.t()
        }
end
