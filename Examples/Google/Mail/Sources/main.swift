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
import Dispatch
import OAuth2
import GoogleAPIRuntime
import Commander

let CLIENT_CREDENTIALS = "gmail.json"
let TOKEN = "gmail.json"

func main() throws {
  let scopes = [
    "https://mail.google.com/",
    "https://www.googleapis.com/auth/gmail.compose",
    "https://www.googleapis.com/auth/gmail.modify",
    "https://www.googleapis.com/auth/gmail.readonly"]

  guard let tokenProvider = BrowserTokenProvider(credentials:CLIENT_CREDENTIALS, token:TOKEN) else {
    return
  }
  let gmail = try Gmail(tokenProvider:tokenProvider)

  let group = Group {
    $0.command("login", description:"Log in with browser-based authentication.") {
      try tokenProvider.signIn(scopes:scopes)
      try tokenProvider.saveToken(TOKEN)
    }

    $0.command(
      "users.getProfile",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Gets the current user's Gmail profile.") {
      userId in
      do {
        var parameters = Gmail.UsersGetProfileParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_getProfile(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users.stop",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Stop receiving push notifications for the given user mailbox.") {
      userId in
      do {
        var parameters = Gmail.UsersStopParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_stop(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users.watch",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_labelFilterAction", default: [], count: 1, description: "Filtering behavior of labelIds list specified."),
      VariadicOption<String>("request_labelIds", default: [], description: "List of label_ids to restrict notifications about. By default, if unspecified, all changes are pushed out. If specified then dictates which labels are required for a push notification to be generated."),
      Options<String>("request_topicName", default: [], count: 1, description: "A fully qualified Google Cloud Pub/Sub API topic name to publish the events to. This topic name **must** already exist in Cloud Pub/Sub and you **must** have already granted gmail 'publish' permission on it. For example, 'projects/my-project-identifier/topics/my-topic-name' (using the Cloud Pub/Sub 'v1' topic naming format).  Note that the 'my-project-identifier' portion must exactly match your Google developer project id (the one executing this watch request)."),
      description: "Set up or update a push notification watch on the given user mailbox.") {
      userId, request_labelFilterAction, request_labelIds, request_topicName in
      do {
        var parameters = Gmail.UsersWatchParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.WatchRequest()
        if let request_labelFilterAction = request_labelFilterAction.first {
          request.labelFilterAction = request_labelFilterAction
        }
        if request_labelIds.count > 0 {
          request.labelIds = request_labelIds
        }
        if let request_topicName = request_topicName.first {
          request.topicName = request_topicName
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_watch(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_drafts.create",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the draft."),
      description: "Creates a new draft with the DRAFT label.") {
      userId, request_id in
      do {
        var parameters = Gmail.Users_draftsCreateParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Draft()
        if let request_id = request_id.first {
          request.id = request_id
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_drafts_create(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_drafts.delete",
      Options<String>("id", default: [], count: 1, description: "The ID of the draft to delete."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Immediately and permanently deletes the specified draft. Does not simply trash it.") {
      id, userId in
      do {
        var parameters = Gmail.Users_draftsDeleteParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_drafts_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_drafts.get",
      Options<String>("format", default: [], count: 1, description: "The format to return the draft in."),
      Options<String>("id", default: [], count: 1, description: "The ID of the draft to retrieve."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Gets the specified draft.") {
      format, id, userId in
      do {
        var parameters = Gmail.Users_draftsGetParameters()
        if let format = format.first {
          parameters.format = format
        }
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_drafts_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_drafts.list",
      Options<Int>("maxResults", default: [], count: 1, description: "Maximum number of drafts to return."),
      Options<String>("pageToken", default: [], count: 1, description: "Page token to retrieve a specific page of results in the list."),
      Options<String>("q", default: [], count: 1, description: "Only return draft messages matching the specified query. Supports the same query format as the Gmail search box. For example, 'from:someuser@example.com rfc822msgid: is:unread'."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Lists the drafts in the user's mailbox.") {
      maxResults, pageToken, q, userId in
      do {
        var parameters = Gmail.Users_draftsListParameters()
        if let maxResults = maxResults.first {
          parameters.maxResults = maxResults
        }
        if let pageToken = pageToken.first {
          parameters.pageToken = pageToken
        }
        if let q = q.first {
          parameters.q = q
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_drafts_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_drafts.send",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the draft."),
      description: "Sends the specified, existing draft to the recipients in the To, Cc, and Bcc headers.") {
      userId, request_id in
      do {
        var parameters = Gmail.Users_draftsSendParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Draft()
        if let request_id = request_id.first {
          request.id = request_id
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_drafts_send(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_drafts.update",
      Options<String>("id", default: [], count: 1, description: "The ID of the draft to update."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the draft."),
      description: "Replaces a draft's content.") {
      id, userId, request_id in
      do {
        var parameters = Gmail.Users_draftsUpdateParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Draft()
        if let request_id = request_id.first {
          request.id = request_id
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_drafts_update(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_history.list",
      Options<String>("historyTypes", default: [], count: 1, description: "History types to be returned by the function"),
      Options<String>("labelId", default: [], count: 1, description: "Only return messages with a label matching the ID."),
      Options<Int>("maxResults", default: [], count: 1, description: "The maximum number of history records to return."),
      Options<String>("pageToken", default: [], count: 1, description: "Page token to retrieve a specific page of results in the list."),
      Options<String>("startHistoryId", default: [], count: 1, description: "Required. Returns history records after the specified startHistoryId. The supplied startHistoryId should be obtained from the historyId of a message, thread, or previous list response. History IDs increase chronologically but are not contiguous with random gaps in between valid IDs. Supplying an invalid or out of date startHistoryId typically returns an HTTP 404 error code. A historyId is typically valid for at least a week, but in some rare circumstances may be valid for only a few hours. If you receive an HTTP 404 error response, your application should perform a full sync. If you receive no nextPageToken in the response, there are no updates to retrieve and you can store the returned historyId for a future request."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Lists the history of all changes to the given mailbox. History results are returned in chronological order (increasing historyId).") {
      historyTypes, labelId, maxResults, pageToken, startHistoryId, userId in
      do {
        var parameters = Gmail.Users_historyListParameters()
        if let historyTypes = historyTypes.first {
          parameters.historyTypes = historyTypes
        }
        if let labelId = labelId.first {
          parameters.labelId = labelId
        }
        if let maxResults = maxResults.first {
          parameters.maxResults = maxResults
        }
        if let pageToken = pageToken.first {
          parameters.pageToken = pageToken
        }
        if let startHistoryId = startHistoryId.first {
          parameters.startHistoryId = startHistoryId
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_history_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_labels.create",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the label."),
      Options<String>("request_labelListVisibility", default: [], count: 1, description: "The visibility of the label in the label list in the Gmail web interface."),
      Options<String>("request_messageListVisibility", default: [], count: 1, description: "The visibility of the label in the message list in the Gmail web interface."),
      Options<Int>("request_messagesTotal", default: [], count: 1, description: "The total number of messages with the label."),
      Options<Int>("request_messagesUnread", default: [], count: 1, description: "The number of unread messages with the label."),
      Options<String>("request_name", default: [], count: 1, description: "The display name of the label."),
      Options<Int>("request_threadsTotal", default: [], count: 1, description: "The total number of threads with the label."),
      Options<Int>("request_threadsUnread", default: [], count: 1, description: "The number of unread threads with the label."),
      Options<String>("request_type", default: [], count: 1, description: "The owner type for the label. User labels are created by the user and can be modified and deleted by the user and can be applied to any message or thread. System labels are internally created and cannot be added, modified, or deleted. System labels may be able to be applied to or removed from messages and threads under some circumstances but this is not guaranteed. For example, users can apply and remove the INBOX and UNREAD labels from messages and threads, but cannot apply or remove the DRAFTS or SENT labels from messages or threads."),
      description: "Creates a new label.") {
      userId, request_id, request_labelListVisibility, request_messageListVisibility, request_messagesTotal, request_messagesUnread, request_name, request_threadsTotal, request_threadsUnread, request_type in
      do {
        var parameters = Gmail.Users_labelsCreateParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Label()
        if let request_id = request_id.first {
          request.id = request_id
        }
        if let request_labelListVisibility = request_labelListVisibility.first {
          request.labelListVisibility = request_labelListVisibility
        }
        if let request_messageListVisibility = request_messageListVisibility.first {
          request.messageListVisibility = request_messageListVisibility
        }
        if let request_messagesTotal = request_messagesTotal.first {
          request.messagesTotal = request_messagesTotal
        }
        if let request_messagesUnread = request_messagesUnread.first {
          request.messagesUnread = request_messagesUnread
        }
        if let request_name = request_name.first {
          request.name = request_name
        }
        if let request_threadsTotal = request_threadsTotal.first {
          request.threadsTotal = request_threadsTotal
        }
        if let request_threadsUnread = request_threadsUnread.first {
          request.threadsUnread = request_threadsUnread
        }
        if let request_type = request_type.first {
          request.type = request_type
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_labels_create(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_labels.delete",
      Options<String>("id", default: [], count: 1, description: "The ID of the label to delete."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Immediately and permanently deletes the specified label and removes it from any messages and threads that it is applied to.") {
      id, userId in
      do {
        var parameters = Gmail.Users_labelsDeleteParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_labels_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_labels.get",
      Options<String>("id", default: [], count: 1, description: "The ID of the label to retrieve."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Gets the specified label.") {
      id, userId in
      do {
        var parameters = Gmail.Users_labelsGetParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_labels_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_labels.list",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Lists all labels in the user's mailbox.") {
      userId in
      do {
        var parameters = Gmail.Users_labelsListParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_labels_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_labels.patch",
      Options<String>("id", default: [], count: 1, description: "The ID of the label to update."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the label."),
      Options<String>("request_labelListVisibility", default: [], count: 1, description: "The visibility of the label in the label list in the Gmail web interface."),
      Options<String>("request_messageListVisibility", default: [], count: 1, description: "The visibility of the label in the message list in the Gmail web interface."),
      Options<Int>("request_messagesTotal", default: [], count: 1, description: "The total number of messages with the label."),
      Options<Int>("request_messagesUnread", default: [], count: 1, description: "The number of unread messages with the label."),
      Options<String>("request_name", default: [], count: 1, description: "The display name of the label."),
      Options<Int>("request_threadsTotal", default: [], count: 1, description: "The total number of threads with the label."),
      Options<Int>("request_threadsUnread", default: [], count: 1, description: "The number of unread threads with the label."),
      Options<String>("request_type", default: [], count: 1, description: "The owner type for the label. User labels are created by the user and can be modified and deleted by the user and can be applied to any message or thread. System labels are internally created and cannot be added, modified, or deleted. System labels may be able to be applied to or removed from messages and threads under some circumstances but this is not guaranteed. For example, users can apply and remove the INBOX and UNREAD labels from messages and threads, but cannot apply or remove the DRAFTS or SENT labels from messages or threads."),
      description: "Updates the specified label. This method supports patch semantics.") {
      id, userId, request_id, request_labelListVisibility, request_messageListVisibility, request_messagesTotal, request_messagesUnread, request_name, request_threadsTotal, request_threadsUnread, request_type in
      do {
        var parameters = Gmail.Users_labelsPatchParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Label()
        if let request_id = request_id.first {
          request.id = request_id
        }
        if let request_labelListVisibility = request_labelListVisibility.first {
          request.labelListVisibility = request_labelListVisibility
        }
        if let request_messageListVisibility = request_messageListVisibility.first {
          request.messageListVisibility = request_messageListVisibility
        }
        if let request_messagesTotal = request_messagesTotal.first {
          request.messagesTotal = request_messagesTotal
        }
        if let request_messagesUnread = request_messagesUnread.first {
          request.messagesUnread = request_messagesUnread
        }
        if let request_name = request_name.first {
          request.name = request_name
        }
        if let request_threadsTotal = request_threadsTotal.first {
          request.threadsTotal = request_threadsTotal
        }
        if let request_threadsUnread = request_threadsUnread.first {
          request.threadsUnread = request_threadsUnread
        }
        if let request_type = request_type.first {
          request.type = request_type
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_labels_patch(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_labels.update",
      Options<String>("id", default: [], count: 1, description: "The ID of the label to update."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the label."),
      Options<String>("request_labelListVisibility", default: [], count: 1, description: "The visibility of the label in the label list in the Gmail web interface."),
      Options<String>("request_messageListVisibility", default: [], count: 1, description: "The visibility of the label in the message list in the Gmail web interface."),
      Options<Int>("request_messagesTotal", default: [], count: 1, description: "The total number of messages with the label."),
      Options<Int>("request_messagesUnread", default: [], count: 1, description: "The number of unread messages with the label."),
      Options<String>("request_name", default: [], count: 1, description: "The display name of the label."),
      Options<Int>("request_threadsTotal", default: [], count: 1, description: "The total number of threads with the label."),
      Options<Int>("request_threadsUnread", default: [], count: 1, description: "The number of unread threads with the label."),
      Options<String>("request_type", default: [], count: 1, description: "The owner type for the label. User labels are created by the user and can be modified and deleted by the user and can be applied to any message or thread. System labels are internally created and cannot be added, modified, or deleted. System labels may be able to be applied to or removed from messages and threads under some circumstances but this is not guaranteed. For example, users can apply and remove the INBOX and UNREAD labels from messages and threads, but cannot apply or remove the DRAFTS or SENT labels from messages or threads."),
      description: "Updates the specified label.") {
      id, userId, request_id, request_labelListVisibility, request_messageListVisibility, request_messagesTotal, request_messagesUnread, request_name, request_threadsTotal, request_threadsUnread, request_type in
      do {
        var parameters = Gmail.Users_labelsUpdateParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Label()
        if let request_id = request_id.first {
          request.id = request_id
        }
        if let request_labelListVisibility = request_labelListVisibility.first {
          request.labelListVisibility = request_labelListVisibility
        }
        if let request_messageListVisibility = request_messageListVisibility.first {
          request.messageListVisibility = request_messageListVisibility
        }
        if let request_messagesTotal = request_messagesTotal.first {
          request.messagesTotal = request_messagesTotal
        }
        if let request_messagesUnread = request_messagesUnread.first {
          request.messagesUnread = request_messagesUnread
        }
        if let request_name = request_name.first {
          request.name = request_name
        }
        if let request_threadsTotal = request_threadsTotal.first {
          request.threadsTotal = request_threadsTotal
        }
        if let request_threadsUnread = request_threadsUnread.first {
          request.threadsUnread = request_threadsUnread
        }
        if let request_type = request_type.first {
          request.type = request_type
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_labels_update(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.batchDelete",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      VariadicOption<String>("request_ids", default: [], description: "The IDs of the messages to delete."),
      description: "Deletes many messages by message ID. Provides no guarantees that messages were not already deleted or even existed at all.") {
      userId, request_ids in
      do {
        // var parameters = Gmail.Users_messagesBatchDeleteParameters()
        // if let userId = userId.first {
        //   parameters.userId = userId
        // }
        // var request = Gmail.BatchDeleteMessagesRequest()
        // if request_ids.count > 0 {
        //   request.ids = request_ids
        // }
        // let sem = DispatchSemaphore(value: 0)
        // try gmail.users_messages_batchDelete(request: request, parameters:parameters) {
        //   error in
        //   if let error = error { print ("ERROR: \(error)") }
        //   sem.signal()
        // }
        // _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.batchModify",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      VariadicOption<String>("request_addLabelIds", default: [], description: "A list of label IDs to add to messages."),
      VariadicOption<String>("request_ids", default: [], description: "The IDs of the messages to modify. There is a limit of 1000 ids per request."),
      VariadicOption<String>("request_removeLabelIds", default: [], description: "A list of label IDs to remove from messages."),
      description: "Modifies the labels on the specified messages.") {
      userId, request_addLabelIds, request_ids, request_removeLabelIds in
      do {
        // var parameters = Gmail.Users_messagesBatchModifyParameters()
        // if let userId = userId.first {
        //   parameters.userId = userId
        // }
        // var request = Gmail.BatchModifyMessagesRequest()
        // if request_addLabelIds.count > 0 {
        //   request.addLabelIds = request_addLabelIds
        // }
        // if request_ids.count > 0 {
        //   request.ids = request_ids
        // }
        // if request_removeLabelIds.count > 0 {
        //   request.removeLabelIds = request_removeLabelIds
        // }
        // let sem = DispatchSemaphore(value: 0)
        // try gmail.users_messages_batchModify(request: request, parameters:parameters) {
        //   error in
        //   if let error = error { print ("ERROR: \(error)") }
        //   sem.signal()
        // }
        // _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.delete",
      Options<String>("id", default: [], count: 1, description: "The ID of the message to delete."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Immediately and permanently deletes the specified message. This operation cannot be undone. Prefer messages.trash instead.") {
      id, userId in
      do {
        var parameters = Gmail.Users_messagesDeleteParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.get",
      Options<String>("format", default: [], count: 1, description: "The format to return the message in."),
      Options<String>("id", default: [], count: 1, description: "The ID of the message to retrieve."),
      Options<String>("metadataHeaders", default: [], count: 1, description: "When given and format is METADATA, only include headers specified."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Gets the specified message.") {
      format, id, metadataHeaders, userId in
      do {
        var parameters = Gmail.Users_messagesGetParameters()
        if let format = format.first {
          parameters.format = format
        }
        if let id = id.first {
          parameters.id = id
        }
        if let metadataHeaders = metadataHeaders.first {
          parameters.metadataHeaders = metadataHeaders
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.import",
      Options<String>("internalDateSource", default: [], count: 1, description: "Source for Gmail's internal date of the message."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_historyId", default: [], count: 1, description: "The ID of the last history record that modified this message."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the message."),
      Options<String>("request_internalDate", default: [], count: 1, description: "The internal message creation timestamp (epoch ms), which determines ordering in the inbox. For normal SMTP-received email, this represents the time the message was originally accepted by Google, which is more reliable than the Date header. However, for API-migrated mail, it can be configured by client to be based on the Date header."),
      VariadicOption<String>("request_labelIds", default: [], description: "List of IDs of labels applied to this message."),
      Options<String>("request_raw", default: [], count: 1, description: "The entire email message in an RFC 2822 formatted and base64url encoded string. Returned in messages.get and drafts.get responses when the format=RAW parameter is supplied."),
      Options<Int>("request_sizeEstimate", default: [], count: 1, description: "Estimated size in bytes of the message."),
      Options<String>("request_snippet", default: [], count: 1, description: "A short part of the message text."),
      Options<String>("request_threadId", default: [], count: 1, description: "The ID of the thread the message belongs to. To add a message or draft to a thread, the following criteria must be met:  - The requested threadId must be specified on the Message or Draft.Message you supply with your request.  - The References and In-Reply-To headers must be set in compliance with the RFC 2822 standard.  - The Subject headers must match."),
      description: "Imports a message into only this user's mailbox, with standard email delivery scanning and classification similar to receiving via SMTP. Does not send a message.") {
      internalDateSource, userId, request_historyId, request_id, request_internalDate, request_labelIds, request_raw, request_sizeEstimate, request_snippet, request_threadId in
      do {
        var parameters = Gmail.Users_messagesImportParameters()
        if let internalDateSource = internalDateSource.first {
          parameters.internalDateSource = internalDateSource
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Message()
        if let request_historyId = request_historyId.first {
          request.historyId = request_historyId
        }
        if let request_id = request_id.first {
          request.id = request_id
        }
        if let request_internalDate = request_internalDate.first {
          request.internalDate = request_internalDate
        }
        if request_labelIds.count > 0 {
          request.labelIds = request_labelIds
        }
        if let request_raw = request_raw.first {
          request.raw = request_raw
        }
        if let request_sizeEstimate = request_sizeEstimate.first {
          request.sizeEstimate = request_sizeEstimate
        }
        if let request_snippet = request_snippet.first {
          request.snippet = request_snippet
        }
        if let request_threadId = request_threadId.first {
          request.threadId = request_threadId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_import(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.insert",
      Options<String>("internalDateSource", default: [], count: 1, description: "Source for Gmail's internal date of the message."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_historyId", default: [], count: 1, description: "The ID of the last history record that modified this message."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the message."),
      Options<String>("request_internalDate", default: [], count: 1, description: "The internal message creation timestamp (epoch ms), which determines ordering in the inbox. For normal SMTP-received email, this represents the time the message was originally accepted by Google, which is more reliable than the Date header. However, for API-migrated mail, it can be configured by client to be based on the Date header."),
      VariadicOption<String>("request_labelIds", default: [], description: "List of IDs of labels applied to this message."),
      Options<String>("request_raw", default: [], count: 1, description: "The entire email message in an RFC 2822 formatted and base64url encoded string. Returned in messages.get and drafts.get responses when the format=RAW parameter is supplied."),
      Options<Int>("request_sizeEstimate", default: [], count: 1, description: "Estimated size in bytes of the message."),
      Options<String>("request_snippet", default: [], count: 1, description: "A short part of the message text."),
      Options<String>("request_threadId", default: [], count: 1, description: "The ID of the thread the message belongs to. To add a message or draft to a thread, the following criteria must be met:  - The requested threadId must be specified on the Message or Draft.Message you supply with your request.  - The References and In-Reply-To headers must be set in compliance with the RFC 2822 standard.  - The Subject headers must match."),
      description: "Directly inserts a message into only this user's mailbox similar to IMAP APPEND, bypassing most scanning and classification. Does not send a message.") {
      internalDateSource, userId, request_historyId, request_id, request_internalDate, request_labelIds, request_raw, request_sizeEstimate, request_snippet, request_threadId in
      do {
        var parameters = Gmail.Users_messagesInsertParameters()
        if let internalDateSource = internalDateSource.first {
          parameters.internalDateSource = internalDateSource
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Message()
        if let request_historyId = request_historyId.first {
          request.historyId = request_historyId
        }
        if let request_id = request_id.first {
          request.id = request_id
        }
        if let request_internalDate = request_internalDate.first {
          request.internalDate = request_internalDate
        }
        if request_labelIds.count > 0 {
          request.labelIds = request_labelIds
        }
        if let request_raw = request_raw.first {
          request.raw = request_raw
        }
        if let request_sizeEstimate = request_sizeEstimate.first {
          request.sizeEstimate = request_sizeEstimate
        }
        if let request_snippet = request_snippet.first {
          request.snippet = request_snippet
        }
        if let request_threadId = request_threadId.first {
          request.threadId = request_threadId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_insert(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.list",
      Options<String>("labelIds", default: [], count: 1, description: "Only return messages with labels that match all of the specified label IDs."),
      Options<Int>("maxResults", default: [], count: 1, description: "Maximum number of messages to return."),
      Options<String>("pageToken", default: [], count: 1, description: "Page token to retrieve a specific page of results in the list."),
      Options<String>("q", default: [], count: 1, description: "Only return messages matching the specified query. Supports the same query format as the Gmail search box. For example, 'from:someuser@example.com rfc822msgid:<somemsgid@example.com> is:unread'. Parameter cannot be used when accessing the api using the gmail.metadata scope."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Lists the messages in the user's mailbox.") {
      labelIds, maxResults, pageToken, q, userId in
      do {
        var parameters = Gmail.Users_messagesListParameters()
        if let labelIds = labelIds.first {
          parameters.labelIds = labelIds
        }
        if let maxResults = maxResults.first {
          parameters.maxResults = maxResults
        }
        if let pageToken = pageToken.first {
          parameters.pageToken = pageToken
        }
        if let q = q.first {
          parameters.q = q
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.modify",
      Options<String>("id", default: [], count: 1, description: "The ID of the message to modify."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      VariadicOption<String>("request_addLabelIds", default: [], description: "A list of IDs of labels to add to this message."),
      VariadicOption<String>("request_removeLabelIds", default: [], description: "A list IDs of labels to remove from this message."),
      description: "Modifies the labels on the specified message.") {
      id, userId, request_addLabelIds, request_removeLabelIds in
      do {
        var parameters = Gmail.Users_messagesModifyParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.ModifyMessageRequest()
        if request_addLabelIds.count > 0 {
          request.addLabelIds = request_addLabelIds
        }
        if request_removeLabelIds.count > 0 {
          request.removeLabelIds = request_removeLabelIds
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_modify(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.send",
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_historyId", default: [], count: 1, description: "The ID of the last history record that modified this message."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID of the message."),
      Options<String>("request_internalDate", default: [], count: 1, description: "The internal message creation timestamp (epoch ms), which determines ordering in the inbox. For normal SMTP-received email, this represents the time the message was originally accepted by Google, which is more reliable than the Date header. However, for API-migrated mail, it can be configured by client to be based on the Date header."),
      VariadicOption<String>("request_labelIds", default: [], description: "List of IDs of labels applied to this message."),
      Options<String>("request_raw", default: [], count: 1, description: "The entire email message in an RFC 2822 formatted and base64url encoded string. Returned in messages.get and drafts.get responses when the format=RAW parameter is supplied."),
      Options<Int>("request_sizeEstimate", default: [], count: 1, description: "Estimated size in bytes of the message."),
      Options<String>("request_snippet", default: [], count: 1, description: "A short part of the message text."),
      Options<String>("request_threadId", default: [], count: 1, description: "The ID of the thread the message belongs to. To add a message or draft to a thread, the following criteria must be met:  - The requested threadId must be specified on the Message or Draft.Message you supply with your request.  - The References and In-Reply-To headers must be set in compliance with the RFC 2822 standard.  - The Subject headers must match."),
      description: "Sends the specified message to the recipients in the To, Cc, and Bcc headers.") {
      userId, request_historyId, request_id, request_internalDate, request_labelIds, request_raw, request_sizeEstimate, request_snippet, request_threadId in
      do {
        var parameters = Gmail.Users_messagesSendParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Message()
        if let request_historyId = request_historyId.first {
          request.historyId = request_historyId
        }
        if let request_id = request_id.first {
          request.id = request_id
        }
        if let request_internalDate = request_internalDate.first {
          request.internalDate = request_internalDate
        }
        if request_labelIds.count > 0 {
          request.labelIds = request_labelIds
        }
        if let request_raw = request_raw.first {
          request.raw = request_raw
        }
        if let request_sizeEstimate = request_sizeEstimate.first {
          request.sizeEstimate = request_sizeEstimate
        }
        if let request_snippet = request_snippet.first {
          request.snippet = request_snippet
        }
        if let request_threadId = request_threadId.first {
          request.threadId = request_threadId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_send(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.trash",
      Options<String>("id", default: [], count: 1, description: "The ID of the message to Trash."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Moves the specified message to the trash.") {
      id, userId in
      do {
        var parameters = Gmail.Users_messagesTrashParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_trash(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages.untrash",
      Options<String>("id", default: [], count: 1, description: "The ID of the message to remove from Trash."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Removes the specified message from the trash.") {
      id, userId in
      do {
        var parameters = Gmail.Users_messagesUntrashParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_untrash(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_messages_attachments.get",
      Options<String>("id", default: [], count: 1, description: "The ID of the attachment."),
      Options<String>("messageId", default: [], count: 1, description: "The ID of the message containing the attachment."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Gets the specified message attachment.") {
      id, messageId, userId in
      do {
        var parameters = Gmail.Users_messages_attachmentsGetParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let messageId = messageId.first {
          parameters.messageId = messageId
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_messages_attachments_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.getAutoForwarding",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets the auto-forwarding setting for the specified account.") {
      userId in
      do {
        var parameters = Gmail.Users_settingsGetAutoForwardingParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_getAutoForwarding(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.getImap",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets IMAP settings.") {
      userId in
      do {
        var parameters = Gmail.Users_settingsGetImapParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_getImap(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.getLanguage",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets language settings.") {
      userId in
      do {
        var parameters = Gmail.Users_settingsGetLanguageParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_getLanguage(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.getPop",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets POP settings.") {
      userId in
      do {
        var parameters = Gmail.Users_settingsGetPopParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_getPop(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.getVacation",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets vacation responder settings.") {
      userId in
      do {
        var parameters = Gmail.Users_settingsGetVacationParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_getVacation(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.updateAutoForwarding",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_disposition", default: [], count: 1, description: "The state that a message should be left in after it has been forwarded."),
      Options<String>("request_emailAddress", default: [], count: 1, description: "Email address to which all incoming messages are forwarded. This email address must be a verified member of the forwarding addresses."),
      description: "Updates the auto-forwarding setting for the specified account. A verified forwarding address must be specified when auto-forwarding is enabled.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      userId, request_disposition, request_emailAddress in
      do {
        var parameters = Gmail.Users_settingsUpdateAutoForwardingParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.AutoForwarding()
        if let request_disposition = request_disposition.first {
          request.disposition = request_disposition
        }
        if let request_emailAddress = request_emailAddress.first {
          request.emailAddress = request_emailAddress
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_updateAutoForwarding(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.updateImap",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_expungeBehavior", default: [], count: 1, description: "The action that will be executed on a message when it is marked as deleted and expunged from the last visible IMAP folder."),
      Options<Int>("request_maxFolderSize", default: [], count: 1, description: "An optional limit on the number of messages that an IMAP folder may contain. Legal values are 0, 1000, 2000, 5000 or 10000. A value of zero is interpreted to mean that there is no limit."),
      description: "Updates IMAP settings.") {
      userId, request_expungeBehavior, request_maxFolderSize in
      do {
        var parameters = Gmail.Users_settingsUpdateImapParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.ImapSettings()
        if let request_expungeBehavior = request_expungeBehavior.first {
          request.expungeBehavior = request_expungeBehavior
        }
        if let request_maxFolderSize = request_maxFolderSize.first {
          request.maxFolderSize = request_maxFolderSize
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_updateImap(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.updateLanguage",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_displayLanguage", default: [], count: 1, description: "The language to display Gmail in, formatted as an RFC 3066 Language Tag (for example en-GB, fr or ja for British English, French, or Japanese respectively).  The set of languages supported by Gmail evolves over time, so please refer to the 'Language' dropdown in the Gmail settings  for all available options, as described in the language settings help article. A table of sample values is also provided in the Managing Language Settings guide   Not all Gmail clients can display the same set of languages. In the case that a user's display language is not available for use on a particular client, said client automatically chooses to display in the closest supported variant (or a reasonable default)."),
      description: "Updates language settings.  If successful, the return object contains the displayLanguage that was saved for the user, which may differ from the value passed into the request. This is because the requested displayLanguage may not be directly supported by Gmail but have a close variant that is, and so the variant may be chosen and saved instead.") {
      userId, request_displayLanguage in
      do {
        var parameters = Gmail.Users_settingsUpdateLanguageParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.LanguageSettings()
        if let request_displayLanguage = request_displayLanguage.first {
          request.displayLanguage = request_displayLanguage
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_updateLanguage(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.updatePop",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_accessWindow", default: [], count: 1, description: "The range of messages which are accessible via POP."),
      Options<String>("request_disposition", default: [], count: 1, description: "The action that will be executed on a message after it has been fetched via POP."),
      description: "Updates POP settings.") {
      userId, request_accessWindow, request_disposition in
      do {
        var parameters = Gmail.Users_settingsUpdatePopParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.PopSettings()
        if let request_accessWindow = request_accessWindow.first {
          request.accessWindow = request_accessWindow
        }
        if let request_disposition = request_disposition.first {
          request.disposition = request_disposition
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_updatePop(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings.updateVacation",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_endTime", default: [], count: 1, description: "An optional end time for sending auto-replies (epoch ms). When this is specified, Gmail will automatically reply only to messages that it receives before the end time. If both startTime and endTime are specified, startTime must precede endTime."),
      Options<String>("request_responseBodyHtml", default: [], count: 1, description: "Response body in HTML format. Gmail will sanitize the HTML before storing it."),
      Options<String>("request_responseBodyPlainText", default: [], count: 1, description: "Response body in plain text format."),
      Options<String>("request_responseSubject", default: [], count: 1, description: "Optional text to prepend to the subject line in vacation responses. In order to enable auto-replies, either the response subject or the response body must be nonempty."),
      Options<String>("request_startTime", default: [], count: 1, description: "An optional start time for sending auto-replies (epoch ms). When this is specified, Gmail will automatically reply only to messages that it receives after the start time. If both startTime and endTime are specified, startTime must precede endTime."),
      description: "Updates vacation responder settings.") {
      userId, request_endTime, request_responseBodyHtml, request_responseBodyPlainText, request_responseSubject, request_startTime in
      do {
        var parameters = Gmail.Users_settingsUpdateVacationParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.VacationSettings()
        if let request_endTime = request_endTime.first {
          request.endTime = request_endTime
        }
        if let request_responseBodyHtml = request_responseBodyHtml.first {
          request.responseBodyHtml = request_responseBodyHtml
        }
        if let request_responseBodyPlainText = request_responseBodyPlainText.first {
          request.responseBodyPlainText = request_responseBodyPlainText
        }
        if let request_responseSubject = request_responseSubject.first {
          request.responseSubject = request_responseSubject
        }
        if let request_startTime = request_startTime.first {
          request.startTime = request_startTime
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_updateVacation(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_delegates.create",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_delegateEmail", default: [], count: 1, description: "The email address of the delegate."),
      Options<String>("request_verificationStatus", default: [], count: 1, description: "Indicates whether this address has been verified and can act as a delegate for the account. Read-only."),
      description: "Adds a delegate with its verification status set directly to accepted, without sending any verification email. The delegate user must be a member of the same G Suite organization as the delegator user.  Gmail imposes limtations on the number of delegates and delegators each user in a G Suite organization can have. These limits depend on your organization, but in general each user can have up to 25 delegates and up to 10 delegators.  Note that a delegate user must be referred to by their primary email address, and not an email alias.  Also note that when a new delegate is created, there may be up to a one minute delay before the new delegate is available for use.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      userId, request_delegateEmail, request_verificationStatus in
      do {
        var parameters = Gmail.Users_settings_delegatesCreateParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Delegate()
        if let request_delegateEmail = request_delegateEmail.first {
          request.delegateEmail = request_delegateEmail
        }
        if let request_verificationStatus = request_verificationStatus.first {
          request.verificationStatus = request_verificationStatus
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_delegates_create(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_delegates.delete",
      Options<String>("delegateEmail", default: [], count: 1, description: "The email address of the user to be removed as a delegate."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Removes the specified delegate (which can be of any verification status), and revokes any verification that may have been required for using it.  Note that a delegate user must be referred to by their primary email address, and not an email alias.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      delegateEmail, userId in
      do {
        var parameters = Gmail.Users_settings_delegatesDeleteParameters()
        if let delegateEmail = delegateEmail.first {
          parameters.delegateEmail = delegateEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_delegates_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_delegates.get",
      Options<String>("delegateEmail", default: [], count: 1, description: "The email address of the user whose delegate relationship is to be retrieved."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets the specified delegate.  Note that a delegate user must be referred to by their primary email address, and not an email alias.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      delegateEmail, userId in
      do {
        var parameters = Gmail.Users_settings_delegatesGetParameters()
        if let delegateEmail = delegateEmail.first {
          parameters.delegateEmail = delegateEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_delegates_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_delegates.list",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Lists the delegates for the specified account.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      userId in
      do {
        var parameters = Gmail.Users_settings_delegatesListParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_delegates_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_filters.create",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_id", default: [], count: 1, description: "The server assigned ID of the filter."),
      description: "Creates a filter.") {
      userId, request_id in
      do {
        var parameters = Gmail.Users_settings_filtersCreateParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.Filter()
        if let request_id = request_id.first {
          request.id = request_id
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_filters_create(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_filters.delete",
      Options<String>("id", default: [], count: 1, description: "The ID of the filter to be deleted."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Deletes a filter.") {
      id, userId in
      do {
        var parameters = Gmail.Users_settings_filtersDeleteParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_filters_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_filters.get",
      Options<String>("id", default: [], count: 1, description: "The ID of the filter to be fetched."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets a filter.") {
      id, userId in
      do {
        var parameters = Gmail.Users_settings_filtersGetParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_filters_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_filters.list",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Lists the message filters of a Gmail user.") {
      userId in
      do {
        var parameters = Gmail.Users_settings_filtersListParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_filters_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_forwardingAddresses.create",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_forwardingEmail", default: [], count: 1, description: "An email address to which messages can be forwarded."),
      Options<String>("request_verificationStatus", default: [], count: 1, description: "Indicates whether this address has been verified and is usable for forwarding. Read-only."),
      description: "Creates a forwarding address. If ownership verification is required, a message will be sent to the recipient and the resource's verification status will be set to pending; otherwise, the resource will be created with verification status set to accepted.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      userId, request_forwardingEmail, request_verificationStatus in
      do {
        var parameters = Gmail.Users_settings_forwardingAddressesCreateParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.ForwardingAddress()
        if let request_forwardingEmail = request_forwardingEmail.first {
          request.forwardingEmail = request_forwardingEmail
        }
        if let request_verificationStatus = request_verificationStatus.first {
          request.verificationStatus = request_verificationStatus
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_forwardingAddresses_create(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_forwardingAddresses.delete",
      Options<String>("forwardingEmail", default: [], count: 1, description: "The forwarding address to be deleted."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Deletes the specified forwarding address and revokes any verification that may have been required.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      forwardingEmail, userId in
      do {
        var parameters = Gmail.Users_settings_forwardingAddressesDeleteParameters()
        if let forwardingEmail = forwardingEmail.first {
          parameters.forwardingEmail = forwardingEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_forwardingAddresses_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_forwardingAddresses.get",
      Options<String>("forwardingEmail", default: [], count: 1, description: "The forwarding address to be retrieved."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets the specified forwarding address.") {
      forwardingEmail, userId in
      do {
        var parameters = Gmail.Users_settings_forwardingAddressesGetParameters()
        if let forwardingEmail = forwardingEmail.first {
          parameters.forwardingEmail = forwardingEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_forwardingAddresses_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_forwardingAddresses.list",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Lists the forwarding addresses for the specified account.") {
      userId in
      do {
        var parameters = Gmail.Users_settings_forwardingAddressesListParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_forwardingAddresses_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs.create",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_displayName", default: [], count: 1, description: "A name that appears in the 'From:' header for mail sent using this alias. For custom 'from' addresses, when this is empty, Gmail will populate the 'From:' header with the name that is used for the primary address associated with the account. If the admin has disabled the ability for users to update their name format, requests to update this field for the primary login will silently fail."),
      Options<String>("request_replyToAddress", default: [], count: 1, description: "An optional email address that is included in a 'Reply-To:' header for mail sent using this alias. If this is empty, Gmail will not generate a 'Reply-To:' header."),
      Options<String>("request_sendAsEmail", default: [], count: 1, description: "The email address that appears in the 'From:' header for mail sent using this alias. This is read-only for all operations except create."),
      Options<String>("request_signature", default: [], count: 1, description: "An optional HTML signature that is included in messages composed with this alias in the Gmail web UI."),
      Options<String>("request_verificationStatus", default: [], count: 1, description: "Indicates whether this address has been verified for use as a send-as alias. Read-only. This setting only applies to custom 'from' aliases."),
      description: "Creates a custom 'from' send-as alias. If an SMTP MSA is specified, Gmail will attempt to connect to the SMTP service to validate the configuration before creating the alias. If ownership verification is required for the alias, a message will be sent to the email address and the resource's verification status will be set to pending; otherwise, the resource will be created with verification status set to accepted. If a signature is provided, Gmail will sanitize the HTML before saving it with the alias.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      userId, request_displayName, request_replyToAddress, request_sendAsEmail, request_signature, request_verificationStatus in
      do {
        var parameters = Gmail.Users_settings_sendAsCreateParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.SendAs()
        if let request_displayName = request_displayName.first {
          request.displayName = request_displayName
        }
        if let request_replyToAddress = request_replyToAddress.first {
          request.replyToAddress = request_replyToAddress
        }
        if let request_sendAsEmail = request_sendAsEmail.first {
          request.sendAsEmail = request_sendAsEmail
        }
        if let request_signature = request_signature.first {
          request.signature = request_signature
        }
        if let request_verificationStatus = request_verificationStatus.first {
          request.verificationStatus = request_verificationStatus
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_create(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs.delete",
      Options<String>("sendAsEmail", default: [], count: 1, description: "The send-as alias to be deleted."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Deletes the specified send-as alias. Revokes any verification that may have been required for using it.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      sendAsEmail, userId in
      do {
        var parameters = Gmail.Users_settings_sendAsDeleteParameters()
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs.get",
      Options<String>("sendAsEmail", default: [], count: 1, description: "The send-as alias to be retrieved."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Gets the specified send-as alias. Fails with an HTTP 404 error if the specified address is not a member of the collection.") {
      sendAsEmail, userId in
      do {
        var parameters = Gmail.Users_settings_sendAsGetParameters()
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs.list",
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Lists the send-as aliases for the specified account. The result includes the primary send-as address associated with the account as well as any custom 'from' aliases.") {
      userId in
      do {
        var parameters = Gmail.Users_settings_sendAsListParameters()
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs.patch",
      Options<String>("sendAsEmail", default: [], count: 1, description: "The send-as alias to be updated."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_displayName", default: [], count: 1, description: "A name that appears in the 'From:' header for mail sent using this alias. For custom 'from' addresses, when this is empty, Gmail will populate the 'From:' header with the name that is used for the primary address associated with the account. If the admin has disabled the ability for users to update their name format, requests to update this field for the primary login will silently fail."),
      Options<String>("request_replyToAddress", default: [], count: 1, description: "An optional email address that is included in a 'Reply-To:' header for mail sent using this alias. If this is empty, Gmail will not generate a 'Reply-To:' header."),
      Options<String>("request_sendAsEmail", default: [], count: 1, description: "The email address that appears in the 'From:' header for mail sent using this alias. This is read-only for all operations except create."),
      Options<String>("request_signature", default: [], count: 1, description: "An optional HTML signature that is included in messages composed with this alias in the Gmail web UI."),
      Options<String>("request_verificationStatus", default: [], count: 1, description: "Indicates whether this address has been verified for use as a send-as alias. Read-only. This setting only applies to custom 'from' aliases."),
      description: "Updates a send-as alias. If a signature is provided, Gmail will sanitize the HTML before saving it with the alias.  Addresses other than the primary address for the account can only be updated by service account clients that have been delegated domain-wide authority. This method supports patch semantics.") {
      sendAsEmail, userId, request_displayName, request_replyToAddress, request_sendAsEmail, request_signature, request_verificationStatus in
      do {
        var parameters = Gmail.Users_settings_sendAsPatchParameters()
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.SendAs()
        if let request_displayName = request_displayName.first {
          request.displayName = request_displayName
        }
        if let request_replyToAddress = request_replyToAddress.first {
          request.replyToAddress = request_replyToAddress
        }
        if let request_sendAsEmail = request_sendAsEmail.first {
          request.sendAsEmail = request_sendAsEmail
        }
        if let request_signature = request_signature.first {
          request.signature = request_signature
        }
        if let request_verificationStatus = request_verificationStatus.first {
          request.verificationStatus = request_verificationStatus
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_patch(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs.update",
      Options<String>("sendAsEmail", default: [], count: 1, description: "The send-as alias to be updated."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      Options<String>("request_displayName", default: [], count: 1, description: "A name that appears in the 'From:' header for mail sent using this alias. For custom 'from' addresses, when this is empty, Gmail will populate the 'From:' header with the name that is used for the primary address associated with the account. If the admin has disabled the ability for users to update their name format, requests to update this field for the primary login will silently fail."),
      Options<String>("request_replyToAddress", default: [], count: 1, description: "An optional email address that is included in a 'Reply-To:' header for mail sent using this alias. If this is empty, Gmail will not generate a 'Reply-To:' header."),
      Options<String>("request_sendAsEmail", default: [], count: 1, description: "The email address that appears in the 'From:' header for mail sent using this alias. This is read-only for all operations except create."),
      Options<String>("request_signature", default: [], count: 1, description: "An optional HTML signature that is included in messages composed with this alias in the Gmail web UI."),
      Options<String>("request_verificationStatus", default: [], count: 1, description: "Indicates whether this address has been verified for use as a send-as alias. Read-only. This setting only applies to custom 'from' aliases."),
      description: "Updates a send-as alias. If a signature is provided, Gmail will sanitize the HTML before saving it with the alias.  Addresses other than the primary address for the account can only be updated by service account clients that have been delegated domain-wide authority.") {
      sendAsEmail, userId, request_displayName, request_replyToAddress, request_sendAsEmail, request_signature, request_verificationStatus in
      do {
        var parameters = Gmail.Users_settings_sendAsUpdateParameters()
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.SendAs()
        if let request_displayName = request_displayName.first {
          request.displayName = request_displayName
        }
        if let request_replyToAddress = request_replyToAddress.first {
          request.replyToAddress = request_replyToAddress
        }
        if let request_sendAsEmail = request_sendAsEmail.first {
          request.sendAsEmail = request_sendAsEmail
        }
        if let request_signature = request_signature.first {
          request.signature = request_signature
        }
        if let request_verificationStatus = request_verificationStatus.first {
          request.verificationStatus = request_verificationStatus
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_update(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs.verify",
      Options<String>("sendAsEmail", default: [], count: 1, description: "The send-as alias to be verified."),
      Options<String>("userId", default: [], count: 1, description: "User's email address. The special value 'me' can be used to indicate the authenticated user."),
      description: "Sends a verification email to the specified send-as alias address. The verification status must be pending.  This method is only available to service account clients that have been delegated domain-wide authority.") {
      sendAsEmail, userId in
      do {
        var parameters = Gmail.Users_settings_sendAsVerifyParameters()
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_verify(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs_smimeInfo.delete",
      Options<String>("id", default: [], count: 1, description: "The immutable ID for the SmimeInfo."),
      Options<String>("sendAsEmail", default: [], count: 1, description: "The email address that appears in the 'From:' header for mail sent using this alias."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Deletes the specified S/MIME config for the specified send-as alias.") {
      id, sendAsEmail, userId in
      do {
        var parameters = Gmail.Users_settings_sendAs_smimeInfoDeleteParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_smimeInfo_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs_smimeInfo.get",
      Options<String>("id", default: [], count: 1, description: "The immutable ID for the SmimeInfo."),
      Options<String>("sendAsEmail", default: [], count: 1, description: "The email address that appears in the 'From:' header for mail sent using this alias."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Gets the specified S/MIME config for the specified send-as alias.") {
      id, sendAsEmail, userId in
      do {
        var parameters = Gmail.Users_settings_sendAs_smimeInfoGetParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_smimeInfo_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs_smimeInfo.insert",
      Options<String>("sendAsEmail", default: [], count: 1, description: "The email address that appears in the 'From:' header for mail sent using this alias."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      Options<String>("request_encryptedKeyPassword", default: [], count: 1, description: "Encrypted key password, when key is encrypted."),
      Options<String>("request_expiration", default: [], count: 1, description: "When the certificate expires (in milliseconds since epoch)."),
      Options<String>("request_id", default: [], count: 1, description: "The immutable ID for the SmimeInfo."),
      Options<String>("request_issuerCn", default: [], count: 1, description: "The S/MIME certificate issuer's common name."),
      Options<String>("request_pem", default: [], count: 1, description: "PEM formatted X509 concatenated certificate string (standard base64 encoding). Format used for returning key, which includes public key as well as certificate chain (not private key)."),
      Options<String>("request_pkcs12", default: [], count: 1, description: "PKCS#12 format containing a single private/public key pair and certificate chain. This format is only accepted from client for creating a new SmimeInfo and is never returned, because the private key is not intended to be exported. PKCS#12 may be encrypted, in which case encryptedKeyPassword should be set appropriately."),
      description: "Insert (upload) the given S/MIME config for the specified send-as alias. Note that pkcs12 format is required for the key.") {
      sendAsEmail, userId, request_encryptedKeyPassword, request_expiration, request_id, request_issuerCn, request_pem, request_pkcs12 in
      do {
        var parameters = Gmail.Users_settings_sendAs_smimeInfoInsertParameters()
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.SmimeInfo()
        if let request_encryptedKeyPassword = request_encryptedKeyPassword.first {
          request.encryptedKeyPassword = request_encryptedKeyPassword
        }
        if let request_expiration = request_expiration.first {
          request.expiration = request_expiration
        }
        if let request_id = request_id.first {
          request.id = request_id
        }
        if let request_issuerCn = request_issuerCn.first {
          request.issuerCn = request_issuerCn
        }
        if let request_pem = request_pem.first {
          request.pem = request_pem
        }
        if let request_pkcs12 = request_pkcs12.first {
          request.pkcs12 = request_pkcs12
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_smimeInfo_insert(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs_smimeInfo.list",
      Options<String>("sendAsEmail", default: [], count: 1, description: "The email address that appears in the 'From:' header for mail sent using this alias."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Lists S/MIME configs for the specified send-as alias.") {
      sendAsEmail, userId in
      do {
        var parameters = Gmail.Users_settings_sendAs_smimeInfoListParameters()
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_smimeInfo_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_settings_sendAs_smimeInfo.setDefault",
      Options<String>("id", default: [], count: 1, description: "The immutable ID for the SmimeInfo."),
      Options<String>("sendAsEmail", default: [], count: 1, description: "The email address that appears in the 'From:' header for mail sent using this alias."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Sets the default S/MIME config for the specified send-as alias.") {
      id, sendAsEmail, userId in
      do {
        var parameters = Gmail.Users_settings_sendAs_smimeInfoSetDefaultParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let sendAsEmail = sendAsEmail.first {
          parameters.sendAsEmail = sendAsEmail
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_settings_sendAs_smimeInfo_setDefault(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_threads.delete",
      Options<String>("id", default: [], count: 1, description: "ID of the Thread to delete."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Immediately and permanently deletes the specified thread. This operation cannot be undone. Prefer threads.trash instead.") {
      id, userId in
      do {
        var parameters = Gmail.Users_threadsDeleteParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_threads_delete(parameters:parameters) {
          error in
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_threads.get",
      Options<String>("format", default: [], count: 1, description: "The format to return the messages in."),
      Options<String>("id", default: [], count: 1, description: "The ID of the thread to retrieve."),
      Options<String>("metadataHeaders", default: [], count: 1, description: "When given and format is METADATA, only include headers specified."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Gets the specified thread.") {
      format, id, metadataHeaders, userId in
      do {
        var parameters = Gmail.Users_threadsGetParameters()
        if let format = format.first {
          parameters.format = format
        }
        if let id = id.first {
          parameters.id = id
        }
        if let metadataHeaders = metadataHeaders.first {
          parameters.metadataHeaders = metadataHeaders
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_threads_get(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_threads.list",
      Options<String>("labelIds", default: [], count: 1, description: "Only return threads with labels that match all of the specified label IDs."),
      Options<Int>("maxResults", default: [], count: 1, description: "Maximum number of threads to return."),
      Options<String>("pageToken", default: [], count: 1, description: "Page token to retrieve a specific page of results in the list."),
      Options<String>("q", default: [], count: 1, description: "Only return threads matching the specified query. Supports the same query format as the Gmail search box. For example, 'from:someuser@example.com rfc822msgid: is:unread'. Parameter cannot be used when accessing the api using the gmail.metadata scope."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Lists the threads in the user's mailbox.") {
      labelIds, maxResults, pageToken, q, userId in
      do {
        var parameters = Gmail.Users_threadsListParameters()
        if let labelIds = labelIds.first {
          parameters.labelIds = labelIds
        }
        if let maxResults = maxResults.first {
          parameters.maxResults = maxResults
        }
        if let pageToken = pageToken.first {
          parameters.pageToken = pageToken
        }
        if let q = q.first {
          parameters.q = q
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_threads_list(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_threads.modify",
      Options<String>("id", default: [], count: 1, description: "The ID of the thread to modify."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      VariadicOption<String>("request_addLabelIds", default: [], description: "A list of IDs of labels to add to this thread."),
      VariadicOption<String>("request_removeLabelIds", default: [], description: "A list of IDs of labels to remove from this thread."),
      description: "Modifies the labels applied to the thread. This applies to all messages in the thread.") {
      id, userId, request_addLabelIds, request_removeLabelIds in
      do {
        var parameters = Gmail.Users_threadsModifyParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        var request = Gmail.ModifyThreadRequest()
        if request_addLabelIds.count > 0 {
          request.addLabelIds = request_addLabelIds
        }
        if request_removeLabelIds.count > 0 {
          request.removeLabelIds = request_removeLabelIds
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_threads_modify(request: request, parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_threads.trash",
      Options<String>("id", default: [], count: 1, description: "The ID of the thread to Trash."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Moves the specified thread to the trash.") {
      id, userId in
      do {
        var parameters = Gmail.Users_threadsTrashParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_threads_trash(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }

    $0.command(
      "users_threads.untrash",
      Options<String>("id", default: [], count: 1, description: "The ID of the thread to remove from Trash."),
      Options<String>("userId", default: [], count: 1, description: "The user's email address. The special value me can be used to indicate the authenticated user."),
      description: "Removes the specified thread from the trash.") {
      id, userId in
      do {
        var parameters = Gmail.Users_threadsUntrashParameters()
        if let id = id.first {
          parameters.id = id
        }
        if let userId = userId.first {
          parameters.userId = userId
        }
        let sem = DispatchSemaphore(value: 0)
        try gmail.users_threads_untrash(parameters:parameters) {
          response, error in
          if let response = response { print ("RESPONSE: \(response)") }
          if let error = error { print ("ERROR: \(error)") }
          sem.signal()
        }
        _ = sem.wait()
      } catch let error {
        print ("Client error: \(error)")
      }
    }
  }
  group.run()
}

do {
  try main()
} catch (let error) {
  print("Application error: \(error)")
}

