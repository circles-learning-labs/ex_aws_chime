defmodule ExAws.Chime.UpdatePhoneNumberRequestItem do
  defstruct [
    :calling_name,
    :phone_number_id,
    :product_type
  ]

  @type t :: %__MODULE__{
          calling_name: String.t(),
          phone_number_id: String.t(),
          product_type: String.t()
        }
end
