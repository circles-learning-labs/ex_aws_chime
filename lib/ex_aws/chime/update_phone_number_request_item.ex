defmodule ExAws.Chime.UpdatePhoneNumberRequestItem do
  @moduledoc """
  Module representing the Chime UpdatePhoneNumberRequestItem data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_UpdatePhoneNumberRequestItem.html
  """

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
