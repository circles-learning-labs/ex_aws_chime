defmodule ExAws.Chime do
  @moduledoc """
  See https://docs.aws.amazon.com/chime/latest/APIReference
  """

  alias ExAws.Chime.CreateAttendeeRequestItem
  alias ExAws.Chime.MembershipItem
  alias ExAws.Chime.MeetingNotificationConfiguration
  alias ExAws.Chime.Tag
  alias ExAws.Chime.UpdatePhoneNumberRequestItem
  alias ExAws.Chime.UpdateUserRequestItem
  alias ExAws.Chime.VoiceConnectorItem
  alias ExAws.Operation.JSON
  alias ExAws.Operation.RestQuery

  # TODO:
  # * Add all actions
  # * Add max results/paging to List actions
  # * Add results filter to List actions
  # * Strip out nils

  ### AWS Chime API

  @spec associate_phone_numbers_with_voice_connector(String.t(), [String.t()], boolean()) ::
          JSON.t()
  def associate_phone_numbers_with_voice_connector(
        voice_connector_id,
        phone_numbers,
        force \\ false
      ) do
    json_request(
      "/voice-connectors/#{voice_connector_id}?operation=associate-phone-numbers",
      %{
        "E164PhoneNumbers" => phone_numbers,
        "ForceAssociate" => force
      }
    )
  end

  @spec associate_phone_numbers_with_voice_connector_group(String.t(), [String.t()], boolean()) ::
          JSON.t()
  def associate_phone_numbers_with_voice_connector_group(
        voice_connector_group_id,
        phone_numbers,
        force \\ false
      ) do
    json_request(
      "/voice-connector-groups/#{voice_connector_group_id}?operation=associate-phone-numbers",
      %{
        "E164PhoneNumbers" => phone_numbers,
        "ForceAssociate" => force
      }
    )
  end

  @spec associate_phone_number_with_user(String.t(), String.t(), String.t()) :: JSON.t()
  def associate_phone_number_with_user(account_id, user_id, phone_number) do
    json_request(
      "/accounts/#{account_id}/users/#{user_id}?operation=associate-phone-numbers",
      %{
        "E164PhoneNumber" => phone_number
      }
    )
  end

  @spec associate_signin_delegate_groups_with_account(String.t(), [String.t()]) :: JSON.t()
  def associate_signin_delegate_groups_with_account(account_id, group_names) do
    json_request(
      "/accounts/#{account_id}?operation=associate-signin-delegate-groups",
      %{
        "SigninDelegateGroups" => Enum.map(group_names, &%{"GroupName" => &1})
      }
    )
  end

  @spec batch_create_attendee(String.t(), [CreateAttendeeRequestItem.t()]) :: JSON.t()
  def batch_create_attendee(meeting_id, attendee_requests) do
    json_request(
      "/meetings/#{meeting_id}/attendees?operation=batch-create",
      %{
        "Attendees" => structs_to_objs(attendee_requests)
      }
    )
  end

  @spec batch_create_room_membership(String.t(), String.t(), MembershipItem.t()) :: JSON.t()
  def batch_create_room_membership(account_id, room_id, memberships) do
    json_request(
      "/accounts/#{account_id}/rooms/#{room_id}/memberships?operation=batch-create",
      %{
        "MembershipItemList" => structs_to_objs(memberships)
      }
    )
  end

  @spec batch_delete_phone_number([String.t()]) :: JSON.t()
  def batch_delete_phone_number(phone_number_ids) do
    json_request(
      "/phone-numbers?operation=batch-delete",
      %{
        "PhoneNumberIds" => phone_number_ids
      }
    )
  end

  @spec batch_suspend_user(String.t(), String.t()) :: JSON.t()
  def batch_suspend_user(account_id, user_ids) do
    json_request(
      "/accounts/#{account_id}/users?operation=suspend",
      %{
        "UserIdList" => user_ids
      }
    )
  end

  @spec batch_unsuspend_user(String.t(), [String.t()]) :: JSON.t()
  def batch_unsuspend_user(account_id, user_ids) do
    json_request(
      "/accounts/#{account_id}/users?operation=unsuspend",
      %{
        "UserIdList" => user_ids
      }
    )
  end

  @spec batch_update_phone_number(UpdatePhoneNumberRequestItem.t()) :: JSON.t()
  def batch_update_phone_number(phone_number_updates) do
    json_request(
      "/phone-numbers?operation=batch-update",
      %{
        "UpdatePhoneNumberRequestItems" => structs_to_objs(phone_number_updates)
      }
    )
  end

  @spec batch_update_user(String.t(), UpdateUserRequestItem.t()) :: JSON.t()
  def batch_update_user(account_id, user_updates) do
    json_request(
      "/accounts/#{account_id}/users",
      %{
        "UpdateUserRequestItems" => structs_to_objs(user_updates)
      }
    )
  end

  @spec create_account(String.t()) :: JSON.t()
  def create_account(name) do
    json_request(
      "/accounts",
      %{
        "Name" => name
      }
    )
  end

  @spec create_attendee(String.t(), CreateAttendeeRequestItem.t()) :: JSON.t()
  def create_attendee(meeting_id, create_attendee) do
    json_request(
      "/meetings/#{meeting_id}/attendees",
      struct_to_obj(create_attendee)
    )
  end

  @spec create_bot(String.t(), String.t(), boolean() | nil) :: JSON.t()
  def create_bot(account_id, display_name, domain \\ nil) do
    json_request(
      "/accounts/#{account_id}/bots",
      %{
        "DisplayName" => display_name,
        "Domain" => domain
      }
    )
  end

  @spec create_meeting(
          String.t() | nil,
          String.t() | nil,
          String.t() | nil,
          MeetingNotificationConfiguration.t() | nil,
          [Tag.t()] | nil
        ) :: JSON.t()
  def create_meeting(
        external_meeting_id \\ nil,
        media_region \\ nil,
        meeting_host_id \\ nil,
        notifications_configuration \\ nil,
        tags \\ nil
      ) do
    json_request(
      "/meetings",
      %{
        "ClientRequestToken" => UUID.uuid4(),
        "ExternalMeetingId" => external_meeting_id,
        "MediaRegion" => media_region,
        "MeetingHostId" => meeting_host_id,
        "NotificationsConfiguration" => struct_to_obj(notifications_configuration),
        "Tags" => struct_to_obj(tags)
      }
    )
  end

  @spec create_meeting_with_attendees(
          [CreateAttendeeRequestItem.t()],
          String.t(),
          String.t() | nil,
          String.t() | nil,
          NotificationsConfiguration.t() | nil,
          [Tag.t()] | nil
        ) :: JSON.t()
  def create_meeting_with_attendees(
        attendees \\ nil,
        external_meeting_id,
        media_region \\ nil,
        meeting_host_id \\ nil,
        notifications_configuration \\ nil,
        tags \\ nil
      ) do
    json_request(
      "/meetings?operation=create-attendees",
      %{
        "Attendees" => struct_to_obj(attendees),
        "ClientRequestToken" => UUID.uuid4(),
        "ExternalMeetingId" => external_meeting_id,
        "MediaRegion" => media_region,
        "MeetingHostId" => meeting_host_id,
        "NotificationsConfiguration" => struct_to_obj(notifications_configuration),
        "Tags" => tags
      }
    )
  end

  @spec create_phone_number_order([String.t()], String.t()) :: JSON.t()
  def create_phone_number_order(phone_numbers, product_type) do
    json_request(
      "/phone-number-orders",
      %{
        "E164PhoneNumbers" => phone_numbers,
        "ProductType" => product_type
      }
    )
  end

  @spec create_proxy_session(
          [String.t()],
          pos_integer() | nil,
          String.t() | nil,
          GeoMatchParams.t() | nil,
          String.t() | nil,
          String.t() | nil,
          [String.t()]
        ) :: JSON.t()
  def create_proxy_session(
        voice_connector_id,
        capabilities,
        expiry_minutes \\ nil,
        geo_match_level \\ nil,
        geo_match_params \\ nil,
        name \\ nil,
        number_selection_behavior \\ nil,
        participant_phone_numbers
      ) do
    json_request(
      "/voice-connectors/#{voice_connector_id}",
      %{
        "Capabilities" => capabilities,
        "ExpiryMinutes" => expiry_minutes,
        "GeoMatchLevel" => geo_match_level,
        "GeoMatchParams" => struct_to_obj(geo_match_params),
        "Name" => name,
        "NumberSelectionBehavior" => number_selection_behavior,
        "ParticipantPhoneNumbers" => participant_phone_numbers
      }
    )
  end

  @spec create_room(String.t(), String.t()) :: JSON.t()
  def create_room(account_id, name) do
    json_request(
      "/accoutns/#{account_id}/rooms",
      %{
        "ClientRequestToken" => UUID.uuid4(),
        "Name" => name
      }
    )
  end

  @spec create_room_membership(String.t(), String.t(), String.t(), String.t() | nil) :: JSON.t()
  def create_room_membership(account_id, room_id, member_id, role \\ nil) do
    json_request(
      "/accounts/#{account_id}/rooms/#{room_id}/memberships",
      %{
        "MemberId" => member_id,
        "Role" => role
      }
    )
  end

  @spec create_user(String.t(), String.t() | nil, String.t() | nil, String.t() | nil) :: JSON.t()
  def create_user(account_id, email \\ nil, username \\ nil, user_type \\ nil) do
    json_request(
      "/accounts/#{account_id}/users/operation=create",
      %{
        "Email" => email,
        "Username" => username,
        "UserType" => user_type
      }
    )
  end

  @spec create_voice_connector(String.t() | nil, String.t(), boolean()) :: JSON.t()
  def create_voice_connector(aws_region \\ nil, name, require_encryption) do
    json_request(
      "/voice-connectors",
      %{
        "AwsRegion" => aws_region,
        "Name" => name,
        "RequireEncryption" => require_encryption
      }
    )
  end

  @spec create_voice_connector_group(String.t(), [VoiceConnectorItem.t()] | nil) :: JSON.t()
  def create_voice_connector_group(name, voice_connector_items \\ nil) do
    json_request(
      "/voice-connector-groups",
      %{
        "Name" => name,
        "VoiceConnectorItems" => structs_to_objs(voice_connector_items)
      }
    )
  end

  @spec delete_account(String.t()) :: RestQuery.t()
  def delete_account(account_id) do
    delete_request("/accounts/#{account_id}")
  end

  @spec delete_attendee(String.t(), String.t()) :: RestQuery.t()
  def delete_attendee(meeting_id, attendee_id) do
    delete_request("/meetings/#{meeting_id}/attendees/#{attendee_id}")
  end

  @spec delete_events_configuration(String.t(), String.t()) :: RestQuery.t()
  def delete_events_configuration(account_id, bot_id) do
    delete_request("/accounts/#{account_id}/bots/#{bot_id}/events-configuration")
  end

  @spec delete_meeting(String.t()) :: RestQuery.t()
  def delete_meeting(meeting_id) do
    delete_request("/meetings/#{meeting_id}")
  end

  @spec delete_phone_number(String.t()) :: RestQuery.t()
  def delete_phone_number(phone_number_id) do
    delete_request("/phone-numbers/#{phone_number_id}")
  end

  @spec delete_proxy_session(String.t(), String.t()) :: RestQuery.t()
  def delete_proxy_session(voice_connector_id, proxy_session_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/proxy-sessions/#{proxy_session_id}")
  end

  @spec delete_room(String.t(), String.t()) :: RestQuery.t()
  def delete_room(account_id, room_id) do
    delete_request("/accounts/#{account_id}/rooms/#{room_id}")
  end

  @spec delete_room_membership(String.t(), String.t(), String.t()) :: RestQuery.t()
  def delete_room_membership(account_id, room_id, member_id) do
    delete_request("/accounts/#{account_id}/rooms/#{room_id}/memberships/#{member_id}")
  end

  @spec delete_voice_connector(String.t()) :: RestQuery.t()
  def delete_voice_connector(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}")
  end

  @spec delete_voice_connector_emergency_calling_configuration(String.t()) :: RestQuery.t()
  def delete_voice_connector_emergency_calling_configuration(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/emergency-calling-configuration")
  end

  @spec delete_voice_connector_group(String.t()) :: RestQuery.t()
  def delete_voice_connector_group(voice_connector_group_id) do
    delete_request("/voice-connector-groups/#{voice_connector_group_id}")
  end

  @spec delete_voice_connector_origination(String.t()) :: RestQuery.t()
  def delete_voice_connector_origination(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/origination")
  end

  @spec delete_voice_connector_proxy(String.t()) :: RestQuery.t()
  def delete_voice_connector_proxy(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/programmable-numbers/proxy")
  end

  @spec delete_voice_connector_streaming_configuration(String.t()) :: RestQuery.t()
  def delete_voice_connector_streaming_configuration(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/streaming-configuration")
  end

  @spec delete_voice_connector_termination(String.t()) :: RestQuery.t()
  def delete_voice_connector_termination(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/termination")
  end

  @spec delete_voice_connector_termination_credentials(String.t(), [String.t()]) :: JSON.t()
  def delete_voice_connector_termination_credentials(voice_connector_id, usernames) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/termination/credentials?operation=delete",
      %{
        "Usernames" => usernames
      }
    )
  end

  @spec disassociate_phone_number_from_user(String.t(), String.t()) :: RestQuery.t()
  def disassociate_phone_number_from_user(account_id, user_id) do
    post_request("/accounts/#{account_id}/users/#{user_id}?operation?disassociate-phone_number")
  end

  @spec disassociate_phone_numbers_from_voice_connector(String.t(), [String.t()]) :: JSON.t()
  def disassociate_phone_numbers_from_voice_connector(voice_connector_id, phone_numbers) do
    json_request(
      "/voice-connectors/#{voice_connector_id}?operation=disassociate-phone-numbers",
      %{
        "E164PhoneNumbers" => phone_numbers
      }
    )
  end

  @spec disassociate_phone_numbers_from_voice_connector_group(String.t(), [String.t()]) ::
          JSON.t()
  def disassociate_phone_numbers_from_voice_connector_group(
        voice_connector_group_id,
        phone_numbers
      ) do
    json_request(
      "/voice-connector-groups/#{voice_connector_group_id}?operation=disassociate-phone-numbers",
      %{
        "E164PhoneNumbers" => phone_numbers
      }
    )
  end

  @spec disassociate_signin_delegate_groups_from_account(String.t(), [String.t()]) :: JSON.t()
  def disassociate_signin_delegate_groups_from_account(account_id, group_names) do
    # TODO
    json_request(
      "/accounts/#{account_id}?operation=disassociate-signin-delegate-groups",
      %{
        "GroupNames" => group_names
      }
    )
  end

  @spec get_account(String.t()) :: RestQuery.t()
  def get_account(account_id) do
    rest_request("/accounts/#{account_id}")
  end

  @spec get_account_settings(String.t()) :: RestQuery.t()
  def get_account_settings(account_id) do
    rest_request("/accounts/#{account_id}/settings")
  end

  @spec get_attendee(String.t(), String.t()) :: RestQuery.t()
  def get_attendee(meeting_id, attendee_id) do
    rest_request("/meetings/#{meeting_id}/attendees/#{attendee_id}")
  end

  @spec get_bot(String.t(), String.t()) :: RestQuery.t()
  def get_bot(account_id, bot_id) do
    rest_request("/accounts/#{account_id}/bots/#{bot_id}")
  end

  @spec get_events_configuration(String.t(), String.t()) :: RestQuery.t()
  def get_events_configuration(account_id, bot_id) do
    rest_request("/accounts/#{account_id}/bots/#{bot_id}/events-configuration")
  end

  @spec get_global_settings() :: RestQuery.t()
  def get_global_settings() do
    rest_request("/settings")
  end

  @spec get_meeting(String.t()) :: RestQuery.t()
  def get_meeting(meeting_id) do
    rest_request("/meetings/#{meeting_id}")
  end

  @spec get_phone_number(String.t()) :: RestQuery.t()
  def get_phone_number(phone_number_id) do
    rest_request("/phone-numbers/#{phone_number_id}")
  end

  @spec get_phone_number_order(String.t()) :: RestQuery.t()
  def get_phone_number_order(phone_number_order_id) do
    rest_request("/phone-number-orders/#{phone_number_order_id}")
  end

  @spec get_phone_number_settings() :: RestQuery.t()
  def get_phone_number_settings() do
    rest_request("/settings/phone-number")
  end

  @spec get_proxy_session(String.t(), String.t()) :: RestQuery.t()
  def get_proxy_session(voice_connector_id, proxy_session_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/proxy-sessoins/#{proxy_session_id}")
  end

  @spec get_retention_settings(String.t()) :: RestQuery.t()
  def get_retention_settings(account_id) do
    rest_request("/accounts/#{account_id}/retention-settings")
  end

  @spec get_room(String.t(), String.t()) :: RestQuery.t()
  def get_room(account_id, room_id) do
    rest_request("/accounts/#{account_id}/rooms/#{room_id}")
  end

  @spec get_user(String.t(), String.t()) :: RestQuery.t()
  def get_user(account_id, user_id) do
    rest_request("/accounts/#{account_id}/users/#{user_id}")
  end

  @spec get_user_settings(String.t(), String.t()) :: RestQuery.t()
  def get_user_settings(account_id, user_id) do
    rest_request("/accounts/#{account_id}/users/#{user_id}/settings")
  end

  @spec get_voice_connector(String.t()) :: RestQuery.t()
  def get_voice_connector(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}")
  end

  @spec get_voice_connector_emergency_calling_configuration(String.t()) :: RestQuery.t()
  def get_voice_connector_emergency_calling_configuration(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/emergency-calling-configuration")
  end

  @spec get_voice_connector_group(String.t()) :: RestQuery.t()
  def get_voice_connector_group(voice_connector_group_id) do
    rest_request("/voice-connector-group/#{voice_connector_group_id}")
  end

  @spec get_voice_connector_logging_configuration(String.t()) :: RestQuery.t()
  def get_voice_connector_logging_configuration(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/logging-configuration")
  end

  @spec get_voice_connector_origination(String.t()) :: RestQuery.t()
  def get_voice_connector_origination(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/origination")
  end

  @spec get_voice_connector_proxy(String.t()) :: RestQuery.t()
  def get_voice_connector_proxy(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/programmable-numbers/proxy")
  end

  @spec get_voice_connector_streaming_configuration(String.t()) :: RestQuery.t()
  def get_voice_connector_streaming_configuration(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/streaming-configuration")
  end

  @spec get_voice_connector_termination(String.t()) :: RestQuery.t()
  def get_voice_connector_termination(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/termination")
  end

  @spec get_voice_connector_termination_health(String.t()) :: RestQuery.t()
  def get_voice_connector_termination_health(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/termination/health")
  end

  @spec invite_users(String.t(), [String.t()], String.t() | nil) :: JSON.t()
  def invite_users(account_id, user_emails, user_type \\ nil) do
    json_request(
      "/accounts/#{account_id}/users?operation=add",
      %{
        "UserEmailList" => user_emails,
        "UserType" => user_type
      }
    )
  end

  @spec list_accounts() :: RestQuery.t()
  def list_accounts() do
    # TODO: Paging
    # TODO: Filters
    rest_request("/accounts")
  end

  @spec list_attendees(String.t()) :: RestQuery.t()
  def list_attendees(meeting_id) do
    # TODO: Paging
    rest_request("/meetings/#{meeting_id}/attendees")
  end

  @spec list_attendee_tags(String.t(), String.t()) :: RestQuery.t()
  def list_attendee_tags(meeting_id, attendee_id) do
    rest_request("/meetings/#{meeting_id}/attendees/#{attendee_id}/tags")
  end

  @spec list_bots(String.t()) :: RestQuery.t()
  def list_bots(account_id) do
    # TODO: Paging
    rest_request("/accounts/#{account_id}/bots")
  end

  @spec list_meetings() :: RestQuery.t()
  def list_meetings() do
    # TODO: Paging
    rest_request("/meetings")
  end

  @spec list_meeting_tags(String.t()) :: RestQuery.t()
  def list_meeting_tags(meeting_id) do
    rest_request("/meetings/#{meeting_id}/tags")
  end

  @spec list_phone_number_orders() :: RestQuery.t()
  def list_phone_number_orders() do
    # TODO: Paging
    # TODO: Filters
    rest_request("/phone-number-orders")
  end

  @spec list_phone_numbers() :: RestQuery.t()
  def list_phone_numbers() do
    # TODO: Paging
    # TODO: Filters
    rest_request("/phone-numbers")
  end

  @spec list_proxy_sessions(String.t()) :: RestQuery.t()
  def list_proxy_sessions(voice_connector_id) do
    # TODO: Paging
    # TODO: Filters
    rest_request("/voice-connectors/#{voice_connector_id}/proxy-sessions")
  end

  @spec list_room_memberships(String.t(), String.t()) :: RestQuery.t()
  def list_room_memberships(account_id, room_id) do
    # TODO: Paging
    rest_request("/accounts/#{account_id}/rooms/#{room_id}/memberships")
  end

  @spec list_rooms(String.t()) :: RestQuery.t()
  def list_rooms(account_id) do
    # TODO: Paging
    rest_request("/accounts/#{account_id}/rooms")
  end

  @spec list_tags_for_resource(String.t()) :: RestQuery.t()
  def list_tags_for_resource(resource_arn) do
    rest_request("/tags/#{resource_arn}")
  end

  @spec list_users(String.t()) :: RestQuery.t()
  def list_users(account_id) do
    # TODO: Paging
    # TODO: Filters
    rest_request("/accounts/#{account_id}/users")
  end

  @spec list_voice_connector_groups() :: RestQuery.t()
  def list_voice_connector_groups() do
    # TODO: Paging
    rest_request("/voice-connector-groups")
  end

  @spec list_voice_connectors() :: RestQuery.t()
  def list_voice_connectors() do
    # TODO: Paging
    rest_request("/voice-connectors")
  end

  @spec list_voice_connector_termination_credentials(String.t()) :: RestQuery.t()
  def list_voice_connector_termination_credentials(voice_connector_id) do
    rest_request("/voice-connectors/#{voice_connector_id}/termination/credentials")
  end

  @spec logout_user(String.t(), String.t()) :: RestQuery.t()
  def logout_user(account_id, user_id) do
    post_request("accounts/#{account_id}/users/#{user_id}?operation=logout")
  end

  @spec put_events_configuration(String.t(), String.t(), String.t() | nil, String.t() | nil) ::
          JSON.t()
  def put_events_configuration(
        account_id,
        bot_id,
        lambda_function_arn \\ nil,
        outbound_events_https_endpoint \\ nil
      ) do
    json_put_request(
      "/accounts/#{account_id}/bots/#{bot_id}/events-configuration",
      %{
        "LambdaFunctionArn" => lambda_function_arn,
        "OutboundEventsHTTPSEndpoint" => outbound_events_https_endpoint
      }
    )
  end

  def put_retention_settings(account_id, retention_settings) do
    json_put_request(
      "/accounts/#{account_id}/retention-settings",
      %{
        "RetentionSettings" => struct_to_obj(retention_settings)
      }
    )
  end

  def put_voice_connector_emergency_calling_configuration() do
    # TODO
  end

  def put_voice_connector_logging_configuration() do
    # TODO
  end

  def put_voice_connector_origination() do
    # TODO
  end

  def put_voice_connector_proxy() do
    # TODO
  end

  def put_voice_connector_streaming_configuration() do
    # TODO
  end

  def put_voice_connector_termination() do
    # TODO
  end

  def put_voice_connector_termination_credentials() do
    # TODO
  end

  def redact_conversation_message(account_id, conversation_id, message_id) do
    post_request(
      "/accounts/#{account_id}/conversations/#{conversation_id}/messages/#{message_id}?operation=redact"
    )
  end

  def redact_room_message(account_id, room_id, message_id) do
    post_request(
      "/accounts/#{account_id}/rooms/#{room_id}/messages/#{message_id}?operation=redact"
    )
  end

  def regenerate_security_token(account_id, bot_id) do
    post_request("/accounts/#{account_id}/bots/#{bot_id}?operation=regenerate-security-token")
  end

  def reset_personal_pin(account_id, user_id) do
    post_request("/accounts/#{account_id}/users/#{user_id}?operation=reset-personal-pin")
  end

  def restore_phone_number(phone_number_id) do
    post_request("/phone-numbers/#{phone_number_id}?operation=restore")
  end

  def search_available_phone_numbers() do
    # TODO
  end

  def tag_attendee(meeting_id, attendee_id, tags) do
    json_request(
      "/meetings/#{meeting_id}/attendees/#{attendee_id}/tags?operation=add",
      %{
        "Tags" => structs_to_objs(tags)
      }
    )
  end

  def tag_meeting(meeting_id, tags) do
    json_request(
      "/meetings/#{meeting_id}/tags?operation=add",
      %{
        "Tags" => structs_to_objs(tags)
      }
    )
  end

  def tag_resource(resource_arn, tags) do
    json_request(
      "/tags?operation=add",
      %{
        "ResourceARN" => resource_arn,
        "Tags" => structs_to_objs(tags)
      }
    )
  end

  def untag_attendee(meeting_id, attendee_id, tag_keys) do
    json_request(
      "/meetings/#{meeting_id}/attendees/#{attendee_id}/tags?operation=delete",
      %{
        "TagKeys" => tag_keys
      }
    )
  end

  def untag_meeting(meeting_id, tag_keys) do
    json_request(
      "/meetings/#{meeting_id}/tags?operation=delete",
      %{
        "TagKeys" => tag_keys
      }
    )
  end

  def untag_resource(resource_arn, tag_keys) do
    json_request(
      "/tags?operation=delete",
      %{
        "ResourceARN" => resource_arn,
        "TagKeys" => tag_keys
      }
    )
  end

  def update_account(account_id, name) do
    json_request(
      "/accounts/#{account_id}",
      %{
        "Name" => name
      }
    )
  end

  def update_account_settings() do
    # TODO
  end

  def update_bot(account_id, bot_id, disabled \\ nil) do
    json_request(
      "/accounts/#{account_id}/bots/#{bot_id}",
      %{
        "Disabled" => disabled
      }
    )
  end

  def update_global_settings() do
    # TODO
  end

  def update_phone_number() do
    # TODO
  end

  def update_phone_number_settings() do
    # TODO
  end

  def update_proxy_session() do
    # TODO
  end

  def update_room(account_id, room_id, name \\ nil) do
    json_request(
      "/accounts/#{account_id}/rooms/#{room_id}",
      %{
        "Name" => name
      }
    )
  end

  def update_room_membership(account_id, room_id, member_id, role \\ nil) do
    json_request(
      "/accounts/#{account_id}/rooms/#{room_id}/memberships/#{member_id}",
      %{
        "Role" => role
      }
    )
  end

  def update_user(
        account_id,
        user_id,
        alexa_for_business_metadata \\ nil,
        license_type \\ nil,
        user_type \\ nil
      ) do
    json_request(
      "/accounts/#{account_id}/users/#{user_id}",
      %{
        "AlexaForBusinessMetadata" => struct_to_obj(alexa_for_business_metadata),
        "LicenseType" => license_type,
        "UserType" => user_type
      }
    )
  end

  def update_user_settings() do
    # TODO
  end

  def update_voice_connector(voice_connector_id, name, require_encryption) do
    json_request(
      "/voice-connectors/#{voice_connector_id}",
      %{
        "Name" => name,
        "RequireEncryption" => require_encryption
      }
    )
  end

  def update_voice_connector_group() do
    # TODO
  end

  ### HELPERS

  defp delete_request(action, params \\ %{}), do: rest_request(action, :delete, params)

  defp rest_request(action, method \\ :get, params \\ %{}) do
    %RestQuery{
      http_method: method,
      path: action,
      params: params,
      service: :chime,
      parser: &parse/2
    }
  end

  defp post_request(path), do: json_request(path, nil)

  defp json_put_request(path, data), do: json_request(path, data, :put)

  defp json_request(path, data, method \\ :post) do
    %JSON{
      http_method: method,
      path: path,
      data: data,
      service: :chime
    }
  end

  defp parse({:ok, %{body: ""}}, _), do: {:ok, :ok}

  defp parse({:ok, %{body: body}}, _) do
    Jason.decode(body)
  end

  defp structs_to_objs(structs), do: Enum.map(structs, &struct_to_obj/1)

  defp struct_to_obj(struct) do
    struct
    |> Map.drop([:__struct__])
    |> Enum.reduce(%{}, fn
      {_k, nil}, acc -> acc
      {k, v}, acc -> Map.put(acc, Macro.camelize(to_string(k)), value_to_obj(v))
    end)
  end

  defp value_to_obj(v) when is_map(v), do: struct_to_obj(v)
  defp value_to_obj(v) when is_list(v), do: Enum.map(v, &value_to_obj/1)
  defp value_to_obj(v) when is_binary(v), do: v
  defp value_to_obj(v) when is_integer(v), do: v
  defp value_to_obj(v) when is_boolean(v), do: v
end
