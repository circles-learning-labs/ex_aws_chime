defmodule ExAws.Chime.MembershipItem do
  defstruct [
    :member_id,
    :role
  ]

  @type t :: %__MODULE__{
          member_id: String.t(),
          role: String.t()
        }
end
