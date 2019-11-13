// Copyright 2019 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// NOTE: This file is automatically-generated!
import Foundation
import OAuth2
import GoogleAPIRuntime

public class Gmail : Service {

  init(tokenProvider: TokenProvider) throws {
    try super.init(tokenProvider, "https://www.googleapis.com/gmail/v1/users/")
  }

  public class Object : Codable {}

  public struct AutoForwarding : Codable {
    public var `disposition` : String?
    public var `emailAddress` : String?
    public var `enabled` : Bool?
  }

  public struct BatchDeleteMessagesRequest : Codable {
    public var `ids` : [String]?
  }

  public struct BatchModifyMessagesRequest : Codable {
    public var `addLabelIds` : [String]?
    public var `ids` : [String]?
    public var `removeLabelIds` : [String]?
  }

  public struct Delegate : Codable {
    public var `delegateEmail` : String?
    public var `verificationStatus` : String?
  }

  public struct Draft : Codable {
    public var `id` : String?
    public var `message` : Message?
  }

  public struct Filter : Codable {
    public var `action` : FilterAction?
    public var `criteria` : FilterCriteria?
    public var `id` : String?
  }

  public struct FilterAction : Codable {
    public var `addLabelIds` : [String]?
    public var `forward` : String?
    public var `removeLabelIds` : [String]?
  }

  public struct FilterCriteria : Codable {
    public var `excludeChats` : Bool?
    public var `from` : String?
    public var `hasAttachment` : Bool?
    public var `negatedQuery` : String?
    public var `query` : String?
    public var `size` : Int?
    public var `sizeComparison` : String?
    public var `subject` : String?
    public var `to` : String?
  }

  public struct ForwardingAddress : Codable {
    public var `forwardingEmail` : String?
    public var `verificationStatus` : String?
  }

  public struct History : Codable {
    public var `id` : String?
    public var `labelsAdded` : [HistoryLabelAdded]?
    public var `labelsRemoved` : [HistoryLabelRemoved]?
    public var `messages` : [Message]?
    public var `messagesAdded` : [HistoryMessageAdded]?
    public var `messagesDeleted` : [HistoryMessageDeleted]?
  }

  public struct HistoryLabelAdded : Codable {
    public var `labelIds` : [String]?
    public var `message` : Message?
  }

  public struct HistoryLabelRemoved : Codable {
    public var `labelIds` : [String]?
    public var `message` : Message?
  }

  public struct HistoryMessageAdded : Codable {
    public var `message` : Message?
  }

  public struct HistoryMessageDeleted : Codable {
    public var `message` : Message?
  }

  public struct ImapSettings : Codable {
    public var `autoExpunge` : Bool?
    public var `enabled` : Bool?
    public var `expungeBehavior` : String?
    public var `maxFolderSize` : Int?
  }

  public struct Label : Codable {
    public var `color` : LabelColor?
    public var `id` : String?
    public var `labelListVisibility` : String?
    public var `messageListVisibility` : String?
    public var `messagesTotal` : Int?
    public var `messagesUnread` : Int?
    public var `name` : String?
    public var `threadsTotal` : Int?
    public var `threadsUnread` : Int?
    public var `type` : String?
  }

  public struct LabelColor : Codable {
    public var `backgroundColor` : String?
    public var `textColor` : String?
  }

  public struct LanguageSettings : Codable {
    public var `displayLanguage` : String?
  }

  public struct ListDelegatesResponse : Codable {
    public var `delegates` : [Delegate]?
  }

  public struct ListDraftsResponse : Codable {
    public var `drafts` : [Draft]?
    public var `nextPageToken` : String?
    public var `resultSizeEstimate` : Int?
  }

  public struct ListFiltersResponse : Codable {
    public var `filter` : [Filter]?
  }

  public struct ListForwardingAddressesResponse : Codable {
    public var `forwardingAddresses` : [ForwardingAddress]?
  }

  public struct ListHistoryResponse : Codable {
    public var `history` : [History]?
    public var `historyId` : String?
    public var `nextPageToken` : String?
  }

  public struct ListLabelsResponse : Codable {
    public var `labels` : [Label]?
  }

  public struct ListMessagesResponse : Codable {
    public var `messages` : [Message]?
    public var `nextPageToken` : String?
    public var `resultSizeEstimate` : Int?
  }

  public struct ListSendAsResponse : Codable {
    public var `sendAs` : [SendAs]?
  }

  public struct ListSmimeInfoResponse : Codable {
    public var `smimeInfo` : [SmimeInfo]?
  }

  public struct ListThreadsResponse : Codable {
    public var `nextPageToken` : String?
    public var `resultSizeEstimate` : Int?
    public var `threads` : [Thread]?
  }

  public struct Message : Codable {
    public var `historyId` : String?
    public var `id` : String?
    public var `internalDate` : String?
    public var `labelIds` : [String]?
    public var `payload` : MessagePart?
    public var `raw` : String?
    public var `sizeEstimate` : Int?
    public var `snippet` : String?
    public var `threadId` : String?
  }

  public struct MessagePart : Codable {
    public var `body` : MessagePartBody?
    public var `filename` : String?
    public var `headers` : [MessagePartHeader]?
    public var `mimeType` : String?
    public var `partId` : String?
    public var `parts` : [MessagePart]?
  }

  public struct MessagePartBody : Codable {
    public var `attachmentId` : String?
    public var `data` : String?
    public var `size` : Int?
  }

  public struct MessagePartHeader : Codable {
    public var `name` : String?
    public var `value` : String?
  }

  public struct ModifyMessageRequest : Codable {
    public var `addLabelIds` : [String]?
    public var `removeLabelIds` : [String]?
  }

  public struct ModifyThreadRequest : Codable {
    public var `addLabelIds` : [String]?
    public var `removeLabelIds` : [String]?
  }

  public struct PopSettings : Codable {
    public var `accessWindow` : String?
    public var `disposition` : String?
  }

  public struct Profile : Codable {
    public var `emailAddress` : String?
    public var `historyId` : String?
    public var `messagesTotal` : Int?
    public var `threadsTotal` : Int?
  }

  public struct SendAs : Codable {
    public var `displayName` : String?
    public var `isDefault` : Bool?
    public var `isPrimary` : Bool?
    public var `replyToAddress` : String?
    public var `sendAsEmail` : String?
    public var `signature` : String?
    public var `smtpMsa` : SmtpMsa?
    public var `treatAsAlias` : Bool?
    public var `verificationStatus` : String?
  }

  public struct SmimeInfo : Codable {
    public var `encryptedKeyPassword` : String?
    public var `expiration` : String?
    public var `id` : String?
    public var `isDefault` : Bool?
    public var `issuerCn` : String?
    public var `pem` : String?
    public var `pkcs12` : String?
  }

  public struct SmtpMsa : Codable {
    public var `host` : String?
    public var `password` : String?
    public var `port` : Int?
    public var `securityMode` : String?
    public var `username` : String?
  }

  public struct Thread : Codable {
    public var `historyId` : String?
    public var `id` : String?
    public var `messages` : [Message]?
    public var `snippet` : String?
  }

  public struct VacationSettings : Codable {
    public var `enableAutoReply` : Bool?
    public var `endTime` : String?
    public var `responseBodyHtml` : String?
    public var `responseBodyPlainText` : String?
    public var `responseSubject` : String?
    public var `restrictToContacts` : Bool?
    public var `restrictToDomain` : Bool?
    public var `startTime` : String?
  }

  public struct WatchRequest : Codable {
    public var `labelFilterAction` : String?
    public var `labelIds` : [String]?
    public var `topicName` : String?
  }

  public struct WatchResponse : Codable {
    public var `expiration` : String?
    public var `historyId` : String?
  }

  public struct UsersGetProfileParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_getProfile (
    parameters: UsersGetProfileParameters,
    completion: @escaping (Profile?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/profile",
        parameters: parameters,
        completion: completion)
  }

  public struct UsersStopParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_stop (
    parameters: UsersStopParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/stop",
        parameters: parameters,
        completion: completion)
  }

  public struct UsersWatchParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_watch (
    request: WatchRequest,
    parameters: UsersWatchParameters,
    completion: @escaping (WatchResponse?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/watch",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_draftsCreateParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_drafts_create (
    request: Draft,
    parameters: Users_draftsCreateParameters,
    completion: @escaping (Draft?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/drafts",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_draftsDeleteParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_drafts_delete (
    parameters: Users_draftsDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/drafts/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_draftsGetParameters : Parameterizable {
    public var format : String?
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["format"]
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_drafts_get (
    parameters: Users_draftsGetParameters,
    completion: @escaping (Draft?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/drafts/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_draftsListParameters : Parameterizable {
    public var includeSpamTrash : Bool?
    public var maxResults : Int?
    public var pageToken : String?
    public var q : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["includeSpamTrash","maxResults","pageToken","q"]
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_drafts_list (
    parameters: Users_draftsListParameters,
    completion: @escaping (ListDraftsResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/drafts",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_draftsSendParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_drafts_send (
    request: Draft,
    parameters: Users_draftsSendParameters,
    completion: @escaping (Message?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/drafts/send",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_draftsUpdateParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_drafts_update (
    request: Draft,
    parameters: Users_draftsUpdateParameters,
    completion: @escaping (Draft?, Error?) -> ()) throws {
      try perform(
        method: "PUT",
        path: "{userId}/drafts/{id}",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_historyListParameters : Parameterizable {
    public var historyTypes : String?
    public var labelId : String?
    public var maxResults : Int?
    public var pageToken : String?
    public var startHistoryId : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["historyTypes","labelId","maxResults","pageToken","startHistoryId"]
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_history_list (
    parameters: Users_historyListParameters,
    completion: @escaping (ListHistoryResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/history",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_labelsCreateParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_labels_create (
    request: Label,
    parameters: Users_labelsCreateParameters,
    completion: @escaping (Label?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/labels",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_labelsDeleteParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_labels_delete (
    parameters: Users_labelsDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/labels/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_labelsGetParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_labels_get (
    parameters: Users_labelsGetParameters,
    completion: @escaping (Label?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/labels/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_labelsListParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_labels_list (
    parameters: Users_labelsListParameters,
    completion: @escaping (ListLabelsResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/labels",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_labelsPatchParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_labels_patch (
    request: Label,
    parameters: Users_labelsPatchParameters,
    completion: @escaping (Label?, Error?) -> ()) throws {
      try perform(
        method: "PATCH",
        path: "{userId}/labels/{id}",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_labelsUpdateParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_labels_update (
    request: Label,
    parameters: Users_labelsUpdateParameters,
    completion: @escaping (Label?, Error?) -> ()) throws {
      try perform(
        method: "PUT",
        path: "{userId}/labels/{id}",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesBatchDeleteParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  // public func users_messages_batchDelete (
  //   request: BatchDeleteMessagesRequest,
  //   parameters: Users_messagesBatchDeleteParameters,
  //   completion: @escaping (Error?) -> ()) throws {
  //     try perform(
  //       method: "POST",
  //       path: "{userId}/messages/batchDelete",
  //       request: request,
  //       parameters: parameters,
  //       completion: completion)
  // }

  public struct Users_messagesBatchModifyParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  // public func users_messages_batchModify (
  //   request: BatchModifyMessagesRequest,
  //   parameters: Users_messagesBatchModifyParameters,
  //   completion: @escaping (Error?) -> ()) throws {
  //     try perform(
  //       method: "POST",
  //       path: "{userId}/messages/batchModify",
  //       request: request,
  //       parameters: parameters,
  //       completion: completion)
  // }

  public struct Users_messagesDeleteParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_messages_delete (
    parameters: Users_messagesDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/messages/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesGetParameters : Parameterizable {
    public var format : String?
    public var id : String?
    public var metadataHeaders : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["format","metadataHeaders"]
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_messages_get (
    parameters: Users_messagesGetParameters,
    completion: @escaping (Message?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/messages/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesImportParameters : Parameterizable {
    public var deleted : Bool?
    public var internalDateSource : String?
    public var neverMarkSpam : Bool?
    public var processForCalendar : Bool?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["deleted","internalDateSource","neverMarkSpam","processForCalendar"]
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_messages_import (
    request: Message,
    parameters: Users_messagesImportParameters,
    completion: @escaping (Message?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/messages/import",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesInsertParameters : Parameterizable {
    public var deleted : Bool?
    public var internalDateSource : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["deleted","internalDateSource"]
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_messages_insert (
    request: Message,
    parameters: Users_messagesInsertParameters,
    completion: @escaping (Message?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/messages",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesListParameters : Parameterizable {
    public var includeSpamTrash : Bool?
    public var labelIds : String?
    public var maxResults : Int?
    public var pageToken : String?
    public var q : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["includeSpamTrash","labelIds","maxResults","pageToken","q"]
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_messages_list (
    parameters: Users_messagesListParameters,
    completion: @escaping (ListMessagesResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/messages",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesModifyParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_messages_modify (
    request: ModifyMessageRequest,
    parameters: Users_messagesModifyParameters,
    completion: @escaping (Message?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/messages/{id}/modify",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesSendParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_messages_send (
    request: Message,
    parameters: Users_messagesSendParameters,
    completion: @escaping (Message?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/messages/send",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesTrashParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_messages_trash (
    parameters: Users_messagesTrashParameters,
    completion: @escaping (Message?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/messages/{id}/trash",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messagesUntrashParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_messages_untrash (
    parameters: Users_messagesUntrashParameters,
    completion: @escaping (Message?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/messages/{id}/untrash",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_messages_attachmentsGetParameters : Parameterizable {
    public var id : String?
    public var messageId : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","messageId","userId"]
    }
  }

  public func users_messages_attachments_get (
    parameters: Users_messages_attachmentsGetParameters,
    completion: @escaping (MessagePartBody?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/messages/{messageId}/attachments/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsGetAutoForwardingParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_getAutoForwarding (
    parameters: Users_settingsGetAutoForwardingParameters,
    completion: @escaping (AutoForwarding?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/autoForwarding",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsGetImapParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_getImap (
    parameters: Users_settingsGetImapParameters,
    completion: @escaping (ImapSettings?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/imap",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsGetLanguageParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_getLanguage (
    parameters: Users_settingsGetLanguageParameters,
    completion: @escaping (LanguageSettings?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/language",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsGetPopParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_getPop (
    parameters: Users_settingsGetPopParameters,
    completion: @escaping (PopSettings?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/pop",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsGetVacationParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_getVacation (
    parameters: Users_settingsGetVacationParameters,
    completion: @escaping (VacationSettings?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/vacation",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsUpdateAutoForwardingParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_updateAutoForwarding (
    request: AutoForwarding,
    parameters: Users_settingsUpdateAutoForwardingParameters,
    completion: @escaping (AutoForwarding?, Error?) -> ()) throws {
      try perform(
        method: "PUT",
        path: "{userId}/settings/autoForwarding",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsUpdateImapParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_updateImap (
    request: ImapSettings,
    parameters: Users_settingsUpdateImapParameters,
    completion: @escaping (ImapSettings?, Error?) -> ()) throws {
      try perform(
        method: "PUT",
        path: "{userId}/settings/imap",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsUpdateLanguageParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_updateLanguage (
    request: LanguageSettings,
    parameters: Users_settingsUpdateLanguageParameters,
    completion: @escaping (LanguageSettings?, Error?) -> ()) throws {
      try perform(
        method: "PUT",
        path: "{userId}/settings/language",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsUpdatePopParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_updatePop (
    request: PopSettings,
    parameters: Users_settingsUpdatePopParameters,
    completion: @escaping (PopSettings?, Error?) -> ()) throws {
      try perform(
        method: "PUT",
        path: "{userId}/settings/pop",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settingsUpdateVacationParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_updateVacation (
    request: VacationSettings,
    parameters: Users_settingsUpdateVacationParameters,
    completion: @escaping (VacationSettings?, Error?) -> ()) throws {
      try perform(
        method: "PUT",
        path: "{userId}/settings/vacation",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_delegatesCreateParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_delegates_create (
    request: Delegate,
    parameters: Users_settings_delegatesCreateParameters,
    completion: @escaping (Delegate?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/settings/delegates",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_delegatesDeleteParameters : Parameterizable {
    public var delegateEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["delegateEmail","userId"]
    }
  }

  public func users_settings_delegates_delete (
    parameters: Users_settings_delegatesDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/settings/delegates/{delegateEmail}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_delegatesGetParameters : Parameterizable {
    public var delegateEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["delegateEmail","userId"]
    }
  }

  public func users_settings_delegates_get (
    parameters: Users_settings_delegatesGetParameters,
    completion: @escaping (Delegate?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/delegates/{delegateEmail}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_delegatesListParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_delegates_list (
    parameters: Users_settings_delegatesListParameters,
    completion: @escaping (ListDelegatesResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/delegates",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_filtersCreateParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_filters_create (
    request: Filter,
    parameters: Users_settings_filtersCreateParameters,
    completion: @escaping (Filter?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/settings/filters",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_filtersDeleteParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_settings_filters_delete (
    parameters: Users_settings_filtersDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/settings/filters/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_filtersGetParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_settings_filters_get (
    parameters: Users_settings_filtersGetParameters,
    completion: @escaping (Filter?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/filters/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_filtersListParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_filters_list (
    parameters: Users_settings_filtersListParameters,
    completion: @escaping (ListFiltersResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/filters",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_forwardingAddressesCreateParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_forwardingAddresses_create (
    request: ForwardingAddress,
    parameters: Users_settings_forwardingAddressesCreateParameters,
    completion: @escaping (ForwardingAddress?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/settings/forwardingAddresses",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_forwardingAddressesDeleteParameters : Parameterizable {
    public var forwardingEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["forwardingEmail","userId"]
    }
  }

  public func users_settings_forwardingAddresses_delete (
    parameters: Users_settings_forwardingAddressesDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/settings/forwardingAddresses/{forwardingEmail}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_forwardingAddressesGetParameters : Parameterizable {
    public var forwardingEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["forwardingEmail","userId"]
    }
  }

  public func users_settings_forwardingAddresses_get (
    parameters: Users_settings_forwardingAddressesGetParameters,
    completion: @escaping (ForwardingAddress?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/forwardingAddresses/{forwardingEmail}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_forwardingAddressesListParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_forwardingAddresses_list (
    parameters: Users_settings_forwardingAddressesListParameters,
    completion: @escaping (ListForwardingAddressesResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/forwardingAddresses",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAsCreateParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_sendAs_create (
    request: SendAs,
    parameters: Users_settings_sendAsCreateParameters,
    completion: @escaping (SendAs?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/settings/sendAs",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAsDeleteParameters : Parameterizable {
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_delete (
    parameters: Users_settings_sendAsDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/settings/sendAs/{sendAsEmail}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAsGetParameters : Parameterizable {
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_get (
    parameters: Users_settings_sendAsGetParameters,
    completion: @escaping (SendAs?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/sendAs/{sendAsEmail}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAsListParameters : Parameterizable {
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_settings_sendAs_list (
    parameters: Users_settings_sendAsListParameters,
    completion: @escaping (ListSendAsResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/sendAs",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAsPatchParameters : Parameterizable {
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_patch (
    request: SendAs,
    parameters: Users_settings_sendAsPatchParameters,
    completion: @escaping (SendAs?, Error?) -> ()) throws {
      try perform(
        method: "PATCH",
        path: "{userId}/settings/sendAs/{sendAsEmail}",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAsUpdateParameters : Parameterizable {
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_update (
    request: SendAs,
    parameters: Users_settings_sendAsUpdateParameters,
    completion: @escaping (SendAs?, Error?) -> ()) throws {
      try perform(
        method: "PUT",
        path: "{userId}/settings/sendAs/{sendAsEmail}",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAsVerifyParameters : Parameterizable {
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_verify (
    parameters: Users_settings_sendAsVerifyParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/settings/sendAs/{sendAsEmail}/verify",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAs_smimeInfoDeleteParameters : Parameterizable {
    public var id : String?
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_smimeInfo_delete (
    parameters: Users_settings_sendAs_smimeInfoDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/settings/sendAs/{sendAsEmail}/smimeInfo/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAs_smimeInfoGetParameters : Parameterizable {
    public var id : String?
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_smimeInfo_get (
    parameters: Users_settings_sendAs_smimeInfoGetParameters,
    completion: @escaping (SmimeInfo?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/sendAs/{sendAsEmail}/smimeInfo/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAs_smimeInfoInsertParameters : Parameterizable {
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_smimeInfo_insert (
    request: SmimeInfo,
    parameters: Users_settings_sendAs_smimeInfoInsertParameters,
    completion: @escaping (SmimeInfo?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/settings/sendAs/{sendAsEmail}/smimeInfo",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAs_smimeInfoListParameters : Parameterizable {
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_smimeInfo_list (
    parameters: Users_settings_sendAs_smimeInfoListParameters,
    completion: @escaping (ListSmimeInfoResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/settings/sendAs/{sendAsEmail}/smimeInfo",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_settings_sendAs_smimeInfoSetDefaultParameters : Parameterizable {
    public var id : String?
    public var sendAsEmail : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","sendAsEmail","userId"]
    }
  }

  public func users_settings_sendAs_smimeInfo_setDefault (
    parameters: Users_settings_sendAs_smimeInfoSetDefaultParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/settings/sendAs/{sendAsEmail}/smimeInfo/{id}/setDefault",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_threadsDeleteParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_threads_delete (
    parameters: Users_threadsDeleteParameters,
    completion: @escaping (Error?) -> ()) throws {
      try perform(
        method: "DELETE",
        path: "{userId}/threads/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_threadsGetParameters : Parameterizable {
    public var format : String?
    public var id : String?
    public var metadataHeaders : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["format","metadataHeaders"]
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_threads_get (
    parameters: Users_threadsGetParameters,
    completion: @escaping (Thread?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/threads/{id}",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_threadsListParameters : Parameterizable {
    public var includeSpamTrash : Bool?
    public var labelIds : String?
    public var maxResults : Int?
    public var pageToken : String?
    public var q : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return ["includeSpamTrash","labelIds","maxResults","pageToken","q"]
    }
    public func pathParameters() -> [String] {
      return ["userId"]
    }
  }

  public func users_threads_list (
    parameters: Users_threadsListParameters,
    completion: @escaping (ListThreadsResponse?, Error?) -> ()) throws {
      try perform(
        method: "GET",
        path: "{userId}/threads",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_threadsModifyParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_threads_modify (
    request: ModifyThreadRequest,
    parameters: Users_threadsModifyParameters,
    completion: @escaping (Thread?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/threads/{id}/modify",
        request: request,
        parameters: parameters,
        completion: completion)
  }

  public struct Users_threadsTrashParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_threads_trash (
    parameters: Users_threadsTrashParameters,
    completion: @escaping (Thread?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/threads/{id}/trash",
        parameters: parameters,
        completion: completion)
  }

  public struct Users_threadsUntrashParameters : Parameterizable {
    public var id : String?
    public var userId : String?
    public func queryParameters() -> [String] {
      return []
    }
    public func pathParameters() -> [String] {
      return ["id","userId"]
    }
  }

  public func users_threads_untrash (
    parameters: Users_threadsUntrashParameters,
    completion: @escaping (Thread?, Error?) -> ()) throws {
      try perform(
        method: "POST",
        path: "{userId}/threads/{id}/untrash",
        parameters: parameters,
        completion: completion)
  }
}

