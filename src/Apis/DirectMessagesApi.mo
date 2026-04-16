// DirectMessagesApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde";
import { type CreateDmConversationRequest; JSON = CreateDmConversationRequest } "../Models/CreateDmConversationRequest";
import { type CreateDmEventResponse; JSON = CreateDmEventResponse } "../Models/CreateDmEventResponse";
import { type CreateMessageRequest; JSON = CreateMessageRequest } "../Models/CreateMessageRequest";
import { type DeleteDmResponse; JSON = DeleteDmResponse } "../Models/DeleteDmResponse";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type Get2DmConversationsIdDmEventsResponse; JSON = Get2DmConversationsIdDmEventsResponse } "../Models/Get2DmConversationsIdDmEventsResponse";
import { type Get2DmConversationsWithParticipantIdDmEventsResponse; JSON = Get2DmConversationsWithParticipantIdDmEventsResponse } "../Models/Get2DmConversationsWithParticipantIdDmEventsResponse";
import { type Get2DmEventsEventIdResponse; JSON = Get2DmEventsEventIdResponse } "../Models/Get2DmEventsEventIdResponse";
import { type Get2DmEventsResponse; JSON = Get2DmEventsResponse } "../Models/Get2DmEventsResponse";
import { type GetChatConversationsUserFieldsParameterInner; JSON = GetChatConversationsUserFieldsParameterInner } "../Models/GetChatConversationsUserFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdEventTypesParameterInner; JSON = GetDirectMessagesEventsByParticipantIdEventTypesParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdEventTypesParameterInner";
import { type GetDirectMessagesEventsByParticipantIdExpansionsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdExpansionsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdExpansionsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type Config } "../Config";

module {
    // Management Canister interface for HTTP outcalls
    // Based on https://github.com/dfinity/interface-spec/blob/master/spec/ic.did
    type http_header = {
        name : Text;
        value : Text;
    };

    type http_method = {
        #get;
        #head;
        #post;
        #put;    // Non-replicated only (is_replicated forced to ?false in generated code)
        #delete; // Non-replicated only (is_replicated forced to ?false in generated code)
    };

    type http_request_args = {
        url : Text;
        max_response_bytes : ?Nat64;
        method : http_method;
        headers : [http_header];
        body : ?Blob;
        transform : ?{
            function : shared query ({ response : http_request_result; context : Blob }) -> async http_request_result;
            context : Blob;
        };
        is_replicated : ?Bool;
    };

    type http_request_result = {
        status : Nat;
        headers : [http_header];
        body : Blob;
    };

    let http_request = (actor "aaaaa-aa" : actor { http_request : (http_request_args) -> async http_request_result }).http_request;


    /// Create DM message by conversation ID
    ///
    /// Sends a new direct message to a specific conversation by its ID.
    public func createDirectMessagesByConversationId(config : Config, dmConversationId : Text, createMessageRequest : CreateMessageRequest) : async* CreateDmEventResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/dm_conversations/{dm_conversation_id}/messages"
            |> Text.replace(_, #text "{dm_conversation_id}", dmConversationId);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #post;
            headers;
            body = do ? {
                let jsonValue = CreateMessageRequest.toJSON(createMessageRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, ["attachments", "text"], null) else throw Error.reject("Failed to serialize to JSON");
                Text.encodeUtf8(jsonText)
            };
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?CreateDmEventResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (CreateDmEventResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to CreateDmEventResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };

            // Try parsing 0 response as Error_
            if (response.status == 0) {
                let errorDetail = if (responseText != "") {
                    switch (JSON.fromText(responseText, null)) {
                        case (#ok(blob)) {
                            let parsedJson : ?Error_.JSON = from_candid(blob);
                            switch (parsedJson) {
                                case (?jsonValue) {
                                    switch (Error_.fromJSON(jsonValue)) {
                                        case (?err) " - " # debug_show(err);
                                        case null " - " # responseText;
                                    }
                                };
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Create DM message by participant ID
    ///
    /// Sends a new direct message to a specific participant by their ID.
    public func createDirectMessagesByParticipantId(config : Config, participantId : Text, createMessageRequest : CreateMessageRequest) : async* CreateDmEventResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/dm_conversations/with/{participant_id}/messages"
            |> Text.replace(_, #text "{participant_id}", participantId);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #post;
            headers;
            body = do ? {
                let jsonValue = CreateMessageRequest.toJSON(createMessageRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, ["attachments", "text"], null) else throw Error.reject("Failed to serialize to JSON");
                Text.encodeUtf8(jsonText)
            };
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?CreateDmEventResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (CreateDmEventResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to CreateDmEventResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };

            // Try parsing 0 response as Error_
            if (response.status == 0) {
                let errorDetail = if (responseText != "") {
                    switch (JSON.fromText(responseText, null)) {
                        case (#ok(blob)) {
                            let parsedJson : ?Error_.JSON = from_candid(blob);
                            switch (parsedJson) {
                                case (?jsonValue) {
                                    switch (Error_.fromJSON(jsonValue)) {
                                        case (?err) " - " # debug_show(err);
                                        case null " - " # responseText;
                                    }
                                };
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Create DM conversation
    ///
    /// Initiates a new direct message conversation with specified participants.
    public func createDirectMessagesConversation(config : Config, createDmConversationRequest : CreateDmConversationRequest) : async* CreateDmEventResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/dm_conversations";

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #post;
            headers;
            body = do ? {
                let jsonValue = CreateDmConversationRequest.toJSON(createDmConversationRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, ["conversation_type", "message", "participant_ids"], null) else throw Error.reject("Failed to serialize to JSON");
                Text.encodeUtf8(jsonText)
            };
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?CreateDmEventResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (CreateDmEventResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to CreateDmEventResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };

            // Try parsing 0 response as Error_
            if (response.status == 0) {
                let errorDetail = if (responseText != "") {
                    switch (JSON.fromText(responseText, null)) {
                        case (#ok(blob)) {
                            let parsedJson : ?Error_.JSON = from_candid(blob);
                            switch (parsedJson) {
                                case (?jsonValue) {
                                    switch (Error_.fromJSON(jsonValue)) {
                                        case (?err) " - " # debug_show(err);
                                        case null " - " # responseText;
                                    }
                                };
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Delete DM event
    ///
    /// Deletes a specific direct message event by its ID, if owned by the authenticated user.
    public func deleteDirectMessagesEvents(config : Config, eventId : Text) : async* DeleteDmResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/dm_events/{event_id}"
            |> Text.replace(_, #text "{event_id}", eventId);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #delete;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?DeleteDmResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (DeleteDmResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to DeleteDmResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };

            // Try parsing 0 response as Error_
            if (response.status == 0) {
                let errorDetail = if (responseText != "") {
                    switch (JSON.fromText(responseText, null)) {
                        case (#ok(blob)) {
                            let parsedJson : ?Error_.JSON = from_candid(blob);
                            switch (parsedJson) {
                                case (?jsonValue) {
                                    switch (Error_.fromJSON(jsonValue)) {
                                        case (?err) " - " # debug_show(err);
                                        case null " - " # responseText;
                                    }
                                };
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Get DM events
    ///
    /// Retrieves a list of recent direct message events across all conversations.
    public func getDirectMessagesEvents(config : Config, maxResults : Nat, paginationToken : Text, eventTypes : [GetDirectMessagesEventsByParticipantIdEventTypesParameterInner], dmEventPeriodfields : [GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner], expansions : [GetDirectMessagesEventsByParticipantIdExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2DmEventsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/dm_events"
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "event_types=" # debug_show(eventTypes) # "&" # "dm_event.fields=" # debug_show(dmEventPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #get;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?Get2DmEventsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2DmEventsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2DmEventsResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };

            // Try parsing 0 response as Error_
            if (response.status == 0) {
                let errorDetail = if (responseText != "") {
                    switch (JSON.fromText(responseText, null)) {
                        case (#ok(blob)) {
                            let parsedJson : ?Error_.JSON = from_candid(blob);
                            switch (parsedJson) {
                                case (?jsonValue) {
                                    switch (Error_.fromJSON(jsonValue)) {
                                        case (?err) " - " # debug_show(err);
                                        case null " - " # responseText;
                                    }
                                };
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Get DM events for a DM conversation
    ///
    /// Retrieves direct message events for a specific conversation.
    public func getDirectMessagesEventsByConversationId(config : Config, id : Text, maxResults : Nat, paginationToken : Text, eventTypes : [GetDirectMessagesEventsByParticipantIdEventTypesParameterInner], dmEventPeriodfields : [GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner], expansions : [GetDirectMessagesEventsByParticipantIdExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2DmConversationsIdDmEventsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/dm_conversations/{id}/dm_events"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "event_types=" # debug_show(eventTypes) # "&" # "dm_event.fields=" # debug_show(dmEventPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #get;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?Get2DmConversationsIdDmEventsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2DmConversationsIdDmEventsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2DmConversationsIdDmEventsResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };

            // Try parsing 0 response as Error_
            if (response.status == 0) {
                let errorDetail = if (responseText != "") {
                    switch (JSON.fromText(responseText, null)) {
                        case (#ok(blob)) {
                            let parsedJson : ?Error_.JSON = from_candid(blob);
                            switch (parsedJson) {
                                case (?jsonValue) {
                                    switch (Error_.fromJSON(jsonValue)) {
                                        case (?err) " - " # debug_show(err);
                                        case null " - " # responseText;
                                    }
                                };
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Get DM event by ID
    ///
    /// Retrieves details of a specific direct message event by its ID.
    public func getDirectMessagesEventsById(config : Config, eventId : Text, dmEventPeriodfields : [GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner], expansions : [GetDirectMessagesEventsByParticipantIdExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2DmEventsEventIdResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/dm_events/{event_id}"
            |> Text.replace(_, #text "{event_id}", eventId)
            # "?" # "dm_event.fields=" # debug_show(dmEventPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #get;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?Get2DmEventsEventIdResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2DmEventsEventIdResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2DmEventsEventIdResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };

            // Try parsing 0 response as Error_
            if (response.status == 0) {
                let errorDetail = if (responseText != "") {
                    switch (JSON.fromText(responseText, null)) {
                        case (#ok(blob)) {
                            let parsedJson : ?Error_.JSON = from_candid(blob);
                            switch (parsedJson) {
                                case (?jsonValue) {
                                    switch (Error_.fromJSON(jsonValue)) {
                                        case (?err) " - " # debug_show(err);
                                        case null " - " # responseText;
                                    }
                                };
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Get DM events for a DM conversation
    ///
    /// Retrieves direct message events for a specific conversation.
    public func getDirectMessagesEventsByParticipantId(config : Config, participantId : Text, maxResults : Nat, paginationToken : Text, eventTypes : [GetDirectMessagesEventsByParticipantIdEventTypesParameterInner], dmEventPeriodfields : [GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner], expansions : [GetDirectMessagesEventsByParticipantIdExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2DmConversationsWithParticipantIdDmEventsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/dm_conversations/with/{participant_id}/dm_events"
            |> Text.replace(_, #text "{participant_id}", participantId)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "event_types=" # debug_show(eventTypes) # "&" # "dm_event.fields=" # debug_show(dmEventPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #get;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?Get2DmConversationsWithParticipantIdDmEventsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2DmConversationsWithParticipantIdDmEventsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2DmConversationsWithParticipantIdDmEventsResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };

            // Try parsing 0 response as Error_
            if (response.status == 0) {
                let errorDetail = if (responseText != "") {
                    switch (JSON.fromText(responseText, null)) {
                        case (#ok(blob)) {
                            let parsedJson : ?Error_.JSON = from_candid(blob);
                            switch (parsedJson) {
                                case (?jsonValue) {
                                    switch (Error_.fromJSON(jsonValue)) {
                                        case (?err) " - " # debug_show(err);
                                        case null " - " # responseText;
                                    }
                                };
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };


    let operations__ = {
        createDirectMessagesByConversationId;
        createDirectMessagesByParticipantId;
        createDirectMessagesConversation;
        deleteDirectMessagesEvents;
        getDirectMessagesEvents;
        getDirectMessagesEventsByConversationId;
        getDirectMessagesEventsById;
        getDirectMessagesEventsByParticipantId;
    };

    public module class DirectMessagesApi(config : Config) {
        /// Create DM message by conversation ID
        ///
        /// Sends a new direct message to a specific conversation by its ID.
        public func createDirectMessagesByConversationId(dmConversationId : Text, createMessageRequest : CreateMessageRequest) : async CreateDmEventResponse {
            await* operations__.createDirectMessagesByConversationId(config, dmConversationId, createMessageRequest)
        };

        /// Create DM message by participant ID
        ///
        /// Sends a new direct message to a specific participant by their ID.
        public func createDirectMessagesByParticipantId(participantId : Text, createMessageRequest : CreateMessageRequest) : async CreateDmEventResponse {
            await* operations__.createDirectMessagesByParticipantId(config, participantId, createMessageRequest)
        };

        /// Create DM conversation
        ///
        /// Initiates a new direct message conversation with specified participants.
        public func createDirectMessagesConversation(createDmConversationRequest : CreateDmConversationRequest) : async CreateDmEventResponse {
            await* operations__.createDirectMessagesConversation(config, createDmConversationRequest)
        };

        /// Delete DM event
        ///
        /// Deletes a specific direct message event by its ID, if owned by the authenticated user.
        public func deleteDirectMessagesEvents(eventId : Text) : async DeleteDmResponse {
            await* operations__.deleteDirectMessagesEvents(config, eventId)
        };

        /// Get DM events
        ///
        /// Retrieves a list of recent direct message events across all conversations.
        public func getDirectMessagesEvents(maxResults : Nat, paginationToken : Text, eventTypes : [GetDirectMessagesEventsByParticipantIdEventTypesParameterInner], dmEventPeriodfields : [GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner], expansions : [GetDirectMessagesEventsByParticipantIdExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2DmEventsResponse {
            await* operations__.getDirectMessagesEvents(config, maxResults, paginationToken, eventTypes, dmEventPeriodfields, expansions, mediaPeriodfields, userPeriodfields, tweetPeriodfields)
        };

        /// Get DM events for a DM conversation
        ///
        /// Retrieves direct message events for a specific conversation.
        public func getDirectMessagesEventsByConversationId(id : Text, maxResults : Nat, paginationToken : Text, eventTypes : [GetDirectMessagesEventsByParticipantIdEventTypesParameterInner], dmEventPeriodfields : [GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner], expansions : [GetDirectMessagesEventsByParticipantIdExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2DmConversationsIdDmEventsResponse {
            await* operations__.getDirectMessagesEventsByConversationId(config, id, maxResults, paginationToken, eventTypes, dmEventPeriodfields, expansions, mediaPeriodfields, userPeriodfields, tweetPeriodfields)
        };

        /// Get DM event by ID
        ///
        /// Retrieves details of a specific direct message event by its ID.
        public func getDirectMessagesEventsById(eventId : Text, dmEventPeriodfields : [GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner], expansions : [GetDirectMessagesEventsByParticipantIdExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2DmEventsEventIdResponse {
            await* operations__.getDirectMessagesEventsById(config, eventId, dmEventPeriodfields, expansions, mediaPeriodfields, userPeriodfields, tweetPeriodfields)
        };

        /// Get DM events for a DM conversation
        ///
        /// Retrieves direct message events for a specific conversation.
        public func getDirectMessagesEventsByParticipantId(participantId : Text, maxResults : Nat, paginationToken : Text, eventTypes : [GetDirectMessagesEventsByParticipantIdEventTypesParameterInner], dmEventPeriodfields : [GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner], expansions : [GetDirectMessagesEventsByParticipantIdExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2DmConversationsWithParticipantIdDmEventsResponse {
            await* operations__.getDirectMessagesEventsByParticipantId(config, participantId, maxResults, paginationToken, eventTypes, dmEventPeriodfields, expansions, mediaPeriodfields, userPeriodfields, tweetPeriodfields)
        };

    }
}
