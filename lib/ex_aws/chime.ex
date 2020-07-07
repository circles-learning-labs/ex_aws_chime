defmodule ExAws.Chime do
  alias ExAws.Operation.JSON
  alias ExAws.Operation.RestQuery

  # TODO:
  # * Add all actions
  # * Add tag support where applicable
  # * Add max results/paging to List actions

  def list_accounts(_opts \\ []) do
    rest_request("/accounts")
  end

  def create_meeting(meeting_id, opts \\ []) do
    data =
      %{
        "ClientRequestToken" => UUID.uuid4(),
        "ExternalMeetingId" => meeting_id
      }
      |> add_opts([meeting_region: "MeetingRegion"], opts)

    json_request("/meetings", data)
  end

  def list_meetings do
    rest_request("/meetings")
  end

  def delete_meeting(meeting_id) do
    rest_request("/meetings/#{meeting_id}", :delete)
  end

  def create_attendee(meeting_id, external_user_id, _opts \\ []) do
    json_request(
      "/meetings/#{meeting_id}/attendees",
      %{
        "ExternalUserId" => external_user_id
      }
    )
  end

  def list_attendees(meeting_id, _opts \\ []) do
    rest_request("/meetings/#{meeting_id}/attendees")
  end

  def delete_attendee(meeting_id, attendee_id, _opts \\ []) do
    rest_request("/meetings/#{meeting_id}/attendees/#{attendee_id}", :delete)
  end

  defp add_opts(base, opts_list, opts) do
    Enum.reduce(opts_list, base, fn {k, d}, acc ->
      case Keyword.get(opts, k) do
        nil -> acc
        value -> Map.put(acc, d, value)
      end
    end)
  end

  defp rest_request(action, method \\ :get, params \\ %{}) do
    %RestQuery{
      http_method: method,
      path: action,
      params: params,
      service: :chime,
      parser: &parse/2
    }
  end

  defp json_request(path, data) do
    %JSON{
      path: path,
      data: data,
      service: :chime
    }
  end

  defp parse({:ok, %{body: ""}}, _), do: {:ok, :ok}

  defp parse({:ok, %{body: body}}, _) do
    Jason.decode(body)
  end
end
