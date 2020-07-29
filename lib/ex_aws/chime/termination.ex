defmodule ExAws.Chime.Termination do
  defstruct [
    :calling_regions,
    :cidr_allowed_list,
    :cps_limit,
    :default_phone_number,
    :disabled
  ]

  @type t :: %__MODULE__{
          calling_regions: [String.t()] | nil,
          cidr_allowed_list: [String.t()] | nil,
          cps_limit: pos_integer() | nil,
          default_phone_number: String.t() | nil,
          disabled: boolean() | nil
        }
end
