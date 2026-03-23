// ChatApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ChatAddGroupMembersRequest; JSON = ChatAddGroupMembersRequest } "../Models/ChatAddGroupMembersRequest";
import { type ChatAddGroupMembersResponse; JSON = ChatAddGroupMembersResponse } "../Models/ChatAddGroupMembersResponse";
import { type ChatAddPublicKeyRequest; JSON = ChatAddPublicKeyRequest } "../Models/ChatAddPublicKeyRequest";
import { type ChatAddPublicKeyResponse; JSON = ChatAddPublicKeyResponse } "../Models/ChatAddPublicKeyResponse";
import { type ChatCreateConversationRequest; JSON = ChatCreateConversationRequest } "../Models/ChatCreateConversationRequest";
import { type ChatCreateConversationResponse; JSON = ChatCreateConversationResponse } "../Models/ChatCreateConversationResponse";
import { type ChatGetConversationResponse; JSON = ChatGetConversationResponse } "../Models/ChatGetConversationResponse";
import { type ChatGetConversationsResponse; JSON = ChatGetConversationsResponse } "../Models/ChatGetConversationsResponse";
import { type ChatInitializeConversationKeysRequest; JSON = ChatInitializeConversationKeysRequest } "../Models/ChatInitializeConversationKeysRequest";
import { type ChatInitializeConversationKeysResponse; JSON = ChatInitializeConversationKeysResponse } "../Models/ChatInitializeConversationKeysResponse";
import { type ChatInitializeGroupResponse; JSON = ChatInitializeGroupResponse } "../Models/ChatInitializeGroupResponse";
import { type ChatMarkConversationReadRequest; JSON = ChatMarkConversationReadRequest } "../Models/ChatMarkConversationReadRequest";
import { type ChatMarkConversationReadResponse; JSON = ChatMarkConversationReadResponse } "../Models/ChatMarkConversationReadResponse";
import { type ChatMediaUploadAppendRequest; JSON = ChatMediaUploadAppendRequest } "../Models/ChatMediaUploadAppendRequest";
import { type ChatMediaUploadFinalizeRequest; JSON = ChatMediaUploadFinalizeRequest } "../Models/ChatMediaUploadFinalizeRequest";
import { type ChatMediaUploadFinalizeResponse; JSON = ChatMediaUploadFinalizeResponse } "../Models/ChatMediaUploadFinalizeResponse";
import { type ChatMediaUploadInitializeRequest; JSON = ChatMediaUploadInitializeRequest } "../Models/ChatMediaUploadInitializeRequest";
import { type ChatMediaUploadInitializeResponse; JSON = ChatMediaUploadInitializeResponse } "../Models/ChatMediaUploadInitializeResponse";
import { type ChatSendMessageRequest; JSON = ChatSendMessageRequest } "../Models/ChatSendMessageRequest";
import { type ChatSendMessageResponse; JSON = ChatSendMessageResponse } "../Models/ChatSendMessageResponse";
import { type ChatSendTypingIndicatorResponse; JSON = ChatSendTypingIndicatorResponse } "../Models/ChatSendTypingIndicatorResponse";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type Get2UsersIdPublicKeysResponse; JSON = Get2UsersIdPublicKeysResponse } "../Models/Get2UsersIdPublicKeysResponse";
import { type Get2UsersPublicKeysResponse; JSON = Get2UsersPublicKeysResponse } "../Models/Get2UsersPublicKeysResponse";
import { type GetChatConversationChatMessageEventFieldsParameterInner; JSON = GetChatConversationChatMessageEventFieldsParameterInner } "../Models/GetChatConversationChatMessageEventFieldsParameterInner";
import { type GetChatConversationsChatConversationFieldsParameterInner; JSON = GetChatConversationsChatConversationFieldsParameterInner } "../Models/GetChatConversationsChatConversationFieldsParameterInner";
import { type GetChatConversationsExpansionsParameterInner; JSON = GetChatConversationsExpansionsParameterInner } "../Models/GetChatConversationsExpansionsParameterInner";
import { type GetChatConversationsUserFieldsParameterInner; JSON = GetChatConversationsUserFieldsParameterInner } "../Models/GetChatConversationsUserFieldsParameterInner";
import { type GetUsersPublicKeysPublicKeyFieldsParameterInner; JSON = GetUsersPublicKeysPublicKeyFieldsParameterInner } "../Models/GetUsersPublicKeysPublicKeyFieldsParameterInner";
import { type MediaUploadAppendResponse; JSON = MediaUploadAppendResponse } "../Models/MediaUploadAppendResponse";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type Config } "../Config";

module {
    // Management Canister interface for HTTP outcalls
    // Based on types in https://github.com/dfinity/sdk/blob/master/src/dfx/src/util/ic.did
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


    /// Add members to a Chat group conversation
    /// Adds one or more members to an existing encrypted Chat group conversation, rotating the conversation key.
    public func addChatGroupMembers(config : Config, id : Text, chatAddGroupMembersRequest : ChatAddGroupMembersRequest) : async* ChatAddGroupMembersResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations/{id}/members"
            |> Text.replace(_, #text "{id}", id);

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
                let jsonValue = ChatAddGroupMembersRequest.toJSON(chatAddGroupMembersRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?ChatAddGroupMembersResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatAddGroupMembersResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatAddGroupMembersResponse");
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

    /// Add public key
    /// Registers a user's public key for X Chat encryption.
    public func addUserPublicKey(config : Config, id : Text, chatAddPublicKeyRequest : ChatAddPublicKeyRequest) : async* ChatAddPublicKeyResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/public_keys"
            |> Text.replace(_, #text "{id}", id);

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
                let jsonValue = ChatAddPublicKeyRequest.toJSON(chatAddPublicKeyRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?ChatAddPublicKeyResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatAddPublicKeyResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatAddPublicKeyResponse");
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

    /// Download Chat Media
    /// Downloads encrypted media bytes from an XChat conversation. The response body contains raw binary bytes. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
    public func chatMediaDownload(config : Config, id : Text, mediaHashKey : Text) : async* Blob {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/media/{id}/{media_hash_key}"
            |> Text.replace(_, #text "{id}", id)
            |> Text.replace(_, #text "{media_hash_key}", mediaHashKey);

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
            from_candid(_) : ?Blob |>
            (switch (_) {
                case (?result) result;
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

    /// Append Chat Media Upload
    /// Appends media data to an XChat upload session.
    public func chatMediaUploadAppend(config : Config, id : Text, chatMediaUploadAppendRequest : ChatMediaUploadAppendRequest) : async* MediaUploadAppendResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/media/upload/{id}/append"
            |> Text.replace(_, #text "{id}", id);

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
                let jsonValue = ChatMediaUploadAppendRequest.toJSON(chatMediaUploadAppendRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?MediaUploadAppendResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MediaUploadAppendResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MediaUploadAppendResponse");
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

    /// Finalize Chat Media Upload
    /// Finalizes an XChat media upload session.
    public func chatMediaUploadFinalize(config : Config, id : Text, chatMediaUploadFinalizeRequest : ChatMediaUploadFinalizeRequest) : async* ChatMediaUploadFinalizeResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/media/upload/{id}/finalize"
            |> Text.replace(_, #text "{id}", id);

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
                let jsonValue = ChatMediaUploadFinalizeRequest.toJSON(chatMediaUploadFinalizeRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?ChatMediaUploadFinalizeResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatMediaUploadFinalizeResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatMediaUploadFinalizeResponse");
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

    /// Initialize Chat Media Upload
    /// Initializes an XChat media upload session.
    public func chatMediaUploadInitialize(config : Config, chatMediaUploadInitializeRequest : ChatMediaUploadInitializeRequest) : async* ChatMediaUploadInitializeResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/media/upload/initialize";

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
                let jsonValue = ChatMediaUploadInitializeRequest.toJSON(chatMediaUploadInitializeRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?ChatMediaUploadInitializeResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatMediaUploadInitializeResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatMediaUploadInitializeResponse");
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

    /// Create Chat Group Conversation
    /// Creates a new encrypted Chat group conversation on behalf of the authenticated user.
    public func createChatConversation(config : Config, chatCreateConversationRequest : ChatCreateConversationRequest) : async* ChatCreateConversationResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations/group";

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
                let jsonValue = ChatCreateConversationRequest.toJSON(chatCreateConversationRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?ChatCreateConversationResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatCreateConversationResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatCreateConversationResponse");
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

    /// Get Chat Conversation
    /// Retrieves messages and key change events for a specific Chat conversation with pagination support. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
    public func getChatConversation(config : Config, id : Text, maxResults : Nat, paginationToken : Text, chatMessageEventPeriodfields : [GetChatConversationChatMessageEventFieldsParameterInner]) : async* ChatGetConversationResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations/{id}"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "chat_message_event.fields=" # debug_show(chatMessageEventPeriodfields);

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
            from_candid(_) : ?ChatGetConversationResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatGetConversationResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatGetConversationResponse");
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

    /// Get Chat Conversations
    /// Retrieves a list of Chat conversations for the authenticated user's inbox.
    public func getChatConversations(config : Config, maxResults : Nat, paginationToken : Text, chatConversationPeriodfields : [GetChatConversationsChatConversationFieldsParameterInner], expansions : [GetChatConversationsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async* ChatGetConversationsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations"
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "chat_conversation.fields=" # debug_show(chatConversationPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields);

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
            from_candid(_) : ?ChatGetConversationsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatGetConversationsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatGetConversationsResponse");
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

    /// Get user public keys
    /// Returns the public keys and Juicebox configuration for the specified user.
    public func getUsersPublicKey(config : Config, id : Text, publicKeyPeriodfields : [GetUsersPublicKeysPublicKeyFieldsParameterInner]) : async* Get2UsersIdPublicKeysResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/public_keys"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "public_key.fields=" # debug_show(publicKeyPeriodfields);

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
            from_candid(_) : ?Get2UsersIdPublicKeysResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdPublicKeysResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdPublicKeysResponse");
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

    /// Get public keys for multiple users
    /// Returns the public keys and Juicebox configuration for the specified users.
    public func getUsersPublicKeys(config : Config, ids : [Text], publicKeyPeriodfields : [GetUsersPublicKeysPublicKeyFieldsParameterInner]) : async* Get2UsersPublicKeysResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/public_keys"
            # "?" # "ids=" # debug_show(ids) # "&" # "public_key.fields=" # debug_show(publicKeyPeriodfields);

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
            from_candid(_) : ?Get2UsersPublicKeysResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersPublicKeysResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersPublicKeysResponse");
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

    /// Initialize Conversation Keys
    /// Initializes encryption keys for a Chat conversation. This is the first step before sending messages in a new 1:1 conversation.  For 1:1 conversations, provide the recipient's user ID as the conversation_id. The server constructs the canonical conversation ID from the authenticated user and recipient.  The request body must contain the conversation key version and participant keys (the conversation key encrypted for each participant using their public key).  **Workflow (1:1 conversation):** 1. Generate a conversation key using the SDK 2. Encrypt the key for both participants using their public keys 3. Call this endpoint to register the keys 4. Send messages using `POST /chat/conversations/{id}/messages`  **Authentication:** - Requires OAuth 1.0a User Context or OAuth 2.0 User Context - Required scopes: `tweet.read`, `users.read`, `dm.write` 
    public func initializeChatConversationKeys(config : Config, id : Text, chatInitializeConversationKeysRequest : ChatInitializeConversationKeysRequest) : async* ChatInitializeConversationKeysResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations/{id}/keys"
            |> Text.replace(_, #text "{id}", id);

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
                let jsonValue = ChatInitializeConversationKeysRequest.toJSON(chatInitializeConversationKeysRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?ChatInitializeConversationKeysResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatInitializeConversationKeysResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatInitializeConversationKeysResponse");
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

    /// Initialize Chat Group
    /// Initializes a new XChat group conversation and returns a unique conversation ID.  This endpoint is the first step in creating a group chat. The returned conversation_id  should be used in subsequent calls to POST /chat/conversations/group to fully create and  configure the group with members, admins, encryption keys, and other settings.  **Workflow:** 1. Call this endpoint to get a `conversation_id` 2. Use that `conversation_id` when calling `POST /chat/conversations/group` to create the group  **Authentication:** - Requires OAuth 1.0a User Context or OAuth 2.0 User Context - Required scope: `dm.write` 
    public func initializeChatGroup(config : Config) : async* ChatInitializeGroupResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations/group/initialize";

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
            from_candid(_) : ?ChatInitializeGroupResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatInitializeGroupResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatInitializeGroupResponse");
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

    /// Mark Conversation as Read
    /// Marks a specific Chat conversation as read on behalf of the authenticated user. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
    public func markChatConversationRead(config : Config, id : Text, chatMarkConversationReadRequest : ChatMarkConversationReadRequest) : async* ChatMarkConversationReadResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations/{id}/read"
            |> Text.replace(_, #text "{id}", id);

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
                let jsonValue = ChatMarkConversationReadRequest.toJSON(chatMarkConversationReadRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?ChatMarkConversationReadResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatMarkConversationReadResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatMarkConversationReadResponse");
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

    /// Send Chat Message
    /// Sends an encrypted message to a specific Chat conversation. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
    public func sendChatMessage(config : Config, id : Text, chatSendMessageRequest : ChatSendMessageRequest) : async* ChatSendMessageResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations/{id}/messages"
            |> Text.replace(_, #text "{id}", id);

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
                let jsonValue = ChatSendMessageRequest.toJSON(chatSendMessageRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, [], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?ChatSendMessageResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatSendMessageResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatSendMessageResponse");
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

    /// Send Typing Indicator
    /// Sends a typing indicator to a specific Chat conversation on behalf of the authenticated user. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
    public func sendChatTypingIndicator(config : Config, id : Text) : async* ChatSendTypingIndicatorResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/chat/conversations/{id}/typing"
            |> Text.replace(_, #text "{id}", id);

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
            from_candid(_) : ?ChatSendTypingIndicatorResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ChatSendTypingIndicatorResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ChatSendTypingIndicatorResponse");
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
        addChatGroupMembers;
        addUserPublicKey;
        chatMediaDownload;
        chatMediaUploadAppend;
        chatMediaUploadFinalize;
        chatMediaUploadInitialize;
        createChatConversation;
        getChatConversation;
        getChatConversations;
        getUsersPublicKey;
        getUsersPublicKeys;
        initializeChatConversationKeys;
        initializeChatGroup;
        markChatConversationRead;
        sendChatMessage;
        sendChatTypingIndicator;
    };

    public module class ChatApi(config : Config) {
        /// Add members to a Chat group conversation
        /// Adds one or more members to an existing encrypted Chat group conversation, rotating the conversation key.
        public func addChatGroupMembers(id : Text, chatAddGroupMembersRequest : ChatAddGroupMembersRequest) : async ChatAddGroupMembersResponse {
            await* operations__.addChatGroupMembers(config, id, chatAddGroupMembersRequest)
        };

        /// Add public key
        /// Registers a user's public key for X Chat encryption.
        public func addUserPublicKey(id : Text, chatAddPublicKeyRequest : ChatAddPublicKeyRequest) : async ChatAddPublicKeyResponse {
            await* operations__.addUserPublicKey(config, id, chatAddPublicKeyRequest)
        };

        /// Download Chat Media
        /// Downloads encrypted media bytes from an XChat conversation. The response body contains raw binary bytes. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
        public func chatMediaDownload(id : Text, mediaHashKey : Text) : async Blob {
            await* operations__.chatMediaDownload(config, id, mediaHashKey)
        };

        /// Append Chat Media Upload
        /// Appends media data to an XChat upload session.
        public func chatMediaUploadAppend(id : Text, chatMediaUploadAppendRequest : ChatMediaUploadAppendRequest) : async MediaUploadAppendResponse {
            await* operations__.chatMediaUploadAppend(config, id, chatMediaUploadAppendRequest)
        };

        /// Finalize Chat Media Upload
        /// Finalizes an XChat media upload session.
        public func chatMediaUploadFinalize(id : Text, chatMediaUploadFinalizeRequest : ChatMediaUploadFinalizeRequest) : async ChatMediaUploadFinalizeResponse {
            await* operations__.chatMediaUploadFinalize(config, id, chatMediaUploadFinalizeRequest)
        };

        /// Initialize Chat Media Upload
        /// Initializes an XChat media upload session.
        public func chatMediaUploadInitialize(chatMediaUploadInitializeRequest : ChatMediaUploadInitializeRequest) : async ChatMediaUploadInitializeResponse {
            await* operations__.chatMediaUploadInitialize(config, chatMediaUploadInitializeRequest)
        };

        /// Create Chat Group Conversation
        /// Creates a new encrypted Chat group conversation on behalf of the authenticated user.
        public func createChatConversation(chatCreateConversationRequest : ChatCreateConversationRequest) : async ChatCreateConversationResponse {
            await* operations__.createChatConversation(config, chatCreateConversationRequest)
        };

        /// Get Chat Conversation
        /// Retrieves messages and key change events for a specific Chat conversation with pagination support. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
        public func getChatConversation(id : Text, maxResults : Nat, paginationToken : Text, chatMessageEventPeriodfields : [GetChatConversationChatMessageEventFieldsParameterInner]) : async ChatGetConversationResponse {
            await* operations__.getChatConversation(config, id, maxResults, paginationToken, chatMessageEventPeriodfields)
        };

        /// Get Chat Conversations
        /// Retrieves a list of Chat conversations for the authenticated user's inbox.
        public func getChatConversations(maxResults : Nat, paginationToken : Text, chatConversationPeriodfields : [GetChatConversationsChatConversationFieldsParameterInner], expansions : [GetChatConversationsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async ChatGetConversationsResponse {
            await* operations__.getChatConversations(config, maxResults, paginationToken, chatConversationPeriodfields, expansions, userPeriodfields)
        };

        /// Get user public keys
        /// Returns the public keys and Juicebox configuration for the specified user.
        public func getUsersPublicKey(id : Text, publicKeyPeriodfields : [GetUsersPublicKeysPublicKeyFieldsParameterInner]) : async Get2UsersIdPublicKeysResponse {
            await* operations__.getUsersPublicKey(config, id, publicKeyPeriodfields)
        };

        /// Get public keys for multiple users
        /// Returns the public keys and Juicebox configuration for the specified users.
        public func getUsersPublicKeys(ids : [Text], publicKeyPeriodfields : [GetUsersPublicKeysPublicKeyFieldsParameterInner]) : async Get2UsersPublicKeysResponse {
            await* operations__.getUsersPublicKeys(config, ids, publicKeyPeriodfields)
        };

        /// Initialize Conversation Keys
        /// Initializes encryption keys for a Chat conversation. This is the first step before sending messages in a new 1:1 conversation.  For 1:1 conversations, provide the recipient's user ID as the conversation_id. The server constructs the canonical conversation ID from the authenticated user and recipient.  The request body must contain the conversation key version and participant keys (the conversation key encrypted for each participant using their public key).  **Workflow (1:1 conversation):** 1. Generate a conversation key using the SDK 2. Encrypt the key for both participants using their public keys 3. Call this endpoint to register the keys 4. Send messages using `POST /chat/conversations/{id}/messages`  **Authentication:** - Requires OAuth 1.0a User Context or OAuth 2.0 User Context - Required scopes: `tweet.read`, `users.read`, `dm.write` 
        public func initializeChatConversationKeys(id : Text, chatInitializeConversationKeysRequest : ChatInitializeConversationKeysRequest) : async ChatInitializeConversationKeysResponse {
            await* operations__.initializeChatConversationKeys(config, id, chatInitializeConversationKeysRequest)
        };

        /// Initialize Chat Group
        /// Initializes a new XChat group conversation and returns a unique conversation ID.  This endpoint is the first step in creating a group chat. The returned conversation_id  should be used in subsequent calls to POST /chat/conversations/group to fully create and  configure the group with members, admins, encryption keys, and other settings.  **Workflow:** 1. Call this endpoint to get a `conversation_id` 2. Use that `conversation_id` when calling `POST /chat/conversations/group` to create the group  **Authentication:** - Requires OAuth 1.0a User Context or OAuth 2.0 User Context - Required scope: `dm.write` 
        public func initializeChatGroup() : async ChatInitializeGroupResponse {
            await* operations__.initializeChatGroup(config)
        };

        /// Mark Conversation as Read
        /// Marks a specific Chat conversation as read on behalf of the authenticated user. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
        public func markChatConversationRead(id : Text, chatMarkConversationReadRequest : ChatMarkConversationReadRequest) : async ChatMarkConversationReadResponse {
            await* operations__.markChatConversationRead(config, id, chatMarkConversationReadRequest)
        };

        /// Send Chat Message
        /// Sends an encrypted message to a specific Chat conversation. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
        public func sendChatMessage(id : Text, chatSendMessageRequest : ChatSendMessageRequest) : async ChatSendMessageResponse {
            await* operations__.sendChatMessage(config, id, chatSendMessageRequest)
        };

        /// Send Typing Indicator
        /// Sends a typing indicator to a specific Chat conversation on behalf of the authenticated user. For 1:1 conversations, provide the recipient's user ID; the server constructs the canonical conversation ID from the authenticated user and recipient.
        public func sendChatTypingIndicator(id : Text) : async ChatSendTypingIndicatorResponse {
            await* operations__.sendChatTypingIndicator(config, id)
        };

    }
}
