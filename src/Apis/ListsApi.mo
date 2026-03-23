// ListsApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type Get2ListsIdFollowersResponse; JSON = Get2ListsIdFollowersResponse } "../Models/Get2ListsIdFollowersResponse";
import { type Get2ListsIdMembersResponse; JSON = Get2ListsIdMembersResponse } "../Models/Get2ListsIdMembersResponse";
import { type Get2ListsIdResponse; JSON = Get2ListsIdResponse } "../Models/Get2ListsIdResponse";
import { type Get2ListsIdTweetsResponse; JSON = Get2ListsIdTweetsResponse } "../Models/Get2ListsIdTweetsResponse";
import { type Get2UsersIdFollowedListsResponse; JSON = Get2UsersIdFollowedListsResponse } "../Models/Get2UsersIdFollowedListsResponse";
import { type Get2UsersIdListMembershipsResponse; JSON = Get2UsersIdListMembershipsResponse } "../Models/Get2UsersIdListMembershipsResponse";
import { type Get2UsersIdOwnedListsResponse; JSON = Get2UsersIdOwnedListsResponse } "../Models/Get2UsersIdOwnedListsResponse";
import { type Get2UsersIdPinnedListsResponse; JSON = Get2UsersIdPinnedListsResponse } "../Models/Get2UsersIdPinnedListsResponse";
import { type GetChatConversationsUserFieldsParameterInner; JSON = GetChatConversationsUserFieldsParameterInner } "../Models/GetChatConversationsUserFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner";
import { type GetListsByIdExpansionsParameterInner; JSON = GetListsByIdExpansionsParameterInner } "../Models/GetListsByIdExpansionsParameterInner";
import { type GetListsByIdListFieldsParameterInner; JSON = GetListsByIdListFieldsParameterInner } "../Models/GetListsByIdListFieldsParameterInner";
import { type GetListsFollowersExpansionsParameterInner; JSON = GetListsFollowersExpansionsParameterInner } "../Models/GetListsFollowersExpansionsParameterInner";
import { type GetListsPostsExpansionsParameterInner; JSON = GetListsPostsExpansionsParameterInner } "../Models/GetListsPostsExpansionsParameterInner";
import { type GetListsPostsPlaceFieldsParameterInner; JSON = GetListsPostsPlaceFieldsParameterInner } "../Models/GetListsPostsPlaceFieldsParameterInner";
import { type GetListsPostsPollFieldsParameterInner; JSON = GetListsPostsPollFieldsParameterInner } "../Models/GetListsPostsPollFieldsParameterInner";
import { type ListAddUserRequest; JSON = ListAddUserRequest } "../Models/ListAddUserRequest";
import { type ListCreateRequest; JSON = ListCreateRequest } "../Models/ListCreateRequest";
import { type ListCreateResponse; JSON = ListCreateResponse } "../Models/ListCreateResponse";
import { type ListDeleteResponse; JSON = ListDeleteResponse } "../Models/ListDeleteResponse";
import { type ListFollowedRequest; JSON = ListFollowedRequest } "../Models/ListFollowedRequest";
import { type ListFollowedResponse; JSON = ListFollowedResponse } "../Models/ListFollowedResponse";
import { type ListMutateResponse; JSON = ListMutateResponse } "../Models/ListMutateResponse";
import { type ListPinnedRequest; JSON = ListPinnedRequest } "../Models/ListPinnedRequest";
import { type ListPinnedResponse; JSON = ListPinnedResponse } "../Models/ListPinnedResponse";
import { type ListUnpinResponse; JSON = ListUnpinResponse } "../Models/ListUnpinResponse";
import { type ListUpdateRequest; JSON = ListUpdateRequest } "../Models/ListUpdateRequest";
import { type ListUpdateResponse; JSON = ListUpdateResponse } "../Models/ListUpdateResponse";
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


    /// Add List member
    /// Adds a User to a specific List by its ID.
    public func addListsMember(config : Config, id : Text, listAddUserRequest : ListAddUserRequest) : async* ListMutateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists/{id}/members"
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
                let jsonValue = ListAddUserRequest.toJSON(listAddUserRequest);
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
            from_candid(_) : ?ListMutateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListMutateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListMutateResponse");
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

    /// Create List
    /// Creates a new List for the authenticated user.
    public func createLists(config : Config, listCreateRequest : ListCreateRequest) : async* ListCreateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists";

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
                let jsonValue = ListCreateRequest.toJSON(listCreateRequest);
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
            from_candid(_) : ?ListCreateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListCreateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListCreateResponse");
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

    /// Delete List
    /// Deletes a specific List owned by the authenticated user by its ID.
    public func deleteLists(config : Config, id : Text) : async* ListDeleteResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists/{id}"
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
            from_candid(_) : ?ListDeleteResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListDeleteResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListDeleteResponse");
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

    /// Follow List
    /// Causes the authenticated user to follow a specific List by its ID.
    public func followList(config : Config, id : Text, listFollowedRequest : ListFollowedRequest) : async* ListFollowedResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/followed_lists"
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
                let jsonValue = ListFollowedRequest.toJSON(listFollowedRequest);
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
            from_candid(_) : ?ListFollowedResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListFollowedResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListFollowedResponse");
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

    /// Get List by ID
    /// Retrieves details of a specific List by its ID.
    public func getListsById(config : Config, id : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async* Get2ListsIdResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists/{id}"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "list.fields=" # debug_show(listPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields);

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
            from_candid(_) : ?Get2ListsIdResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2ListsIdResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2ListsIdResponse");
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

    /// Get List followers
    /// Retrieves a list of Users who follow a specific List by its ID.
    public func getListsFollowers(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2ListsIdFollowersResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists/{id}/followers"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2ListsIdFollowersResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2ListsIdFollowersResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2ListsIdFollowersResponse");
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

    /// Get List members
    /// Retrieves a list of Users who are members of a specific List by its ID.
    public func getListsMembers(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2ListsIdMembersResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists/{id}/members"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2ListsIdMembersResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2ListsIdMembersResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2ListsIdMembersResponse");
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

    /// Get List Posts
    /// Retrieves a list of Posts associated with a specific List by its ID.
    public func getListsPosts(config : Config, id : Text, maxResults : Nat, paginationToken : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2ListsIdTweetsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists/{id}/tweets"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?Get2ListsIdTweetsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2ListsIdTweetsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2ListsIdTweetsResponse");
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

    /// Get followed Lists
    /// Retrieves a list of Lists followed by a specific User by their ID.
    public func getUsersFollowedLists(config : Config, id : Text, maxResults : Nat, paginationToken : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async* Get2UsersIdFollowedListsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/followed_lists"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "list.fields=" # debug_show(listPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields);

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
            from_candid(_) : ?Get2UsersIdFollowedListsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdFollowedListsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdFollowedListsResponse");
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

    /// Get List memberships
    /// Retrieves a list of Lists that a specific User is a member of by their ID.
    public func getUsersListMemberships(config : Config, id : Text, maxResults : Nat, paginationToken : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async* Get2UsersIdListMembershipsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/list_memberships"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "list.fields=" # debug_show(listPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields);

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
            from_candid(_) : ?Get2UsersIdListMembershipsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdListMembershipsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdListMembershipsResponse");
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

    /// Get owned Lists
    /// Retrieves a list of Lists owned by a specific User by their ID.
    public func getUsersOwnedLists(config : Config, id : Text, maxResults : Nat, paginationToken : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async* Get2UsersIdOwnedListsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/owned_lists"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "list.fields=" # debug_show(listPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields);

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
            from_candid(_) : ?Get2UsersIdOwnedListsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdOwnedListsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdOwnedListsResponse");
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

    /// Get pinned Lists
    /// Retrieves a list of Lists pinned by the authenticated user.
    public func getUsersPinnedLists(config : Config, id : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async* Get2UsersIdPinnedListsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/pinned_lists"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "list.fields=" # debug_show(listPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields);

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
            from_candid(_) : ?Get2UsersIdPinnedListsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdPinnedListsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdPinnedListsResponse");
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

    /// Pin List
    /// Causes the authenticated user to pin a specific List by its ID.
    public func pinList(config : Config, id : Text, listPinnedRequest : ListPinnedRequest) : async* ListPinnedResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/pinned_lists"
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
                let jsonValue = ListPinnedRequest.toJSON(listPinnedRequest);
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
            from_candid(_) : ?ListPinnedResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListPinnedResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListPinnedResponse");
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

    /// Remove List member
    /// Removes a User from a specific List by its ID and the User’s ID.
    public func removeListsMemberByUserId(config : Config, id : Text, userId : Text) : async* ListMutateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists/{id}/members/{user_id}"
            |> Text.replace(_, #text "{id}", id)
            |> Text.replace(_, #text "{user_id}", userId);

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
            from_candid(_) : ?ListMutateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListMutateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListMutateResponse");
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

    /// Unfollow List
    /// Causes the authenticated user to unfollow a specific List by its ID.
    public func unfollowList(config : Config, id : Text, listId : Text) : async* ListFollowedResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/followed_lists/{list_id}"
            |> Text.replace(_, #text "{id}", id)
            |> Text.replace(_, #text "{list_id}", listId);

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
            from_candid(_) : ?ListFollowedResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListFollowedResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListFollowedResponse");
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

    /// Unpin List
    /// Causes the authenticated user to unpin a specific List by its ID.
    public func unpinList(config : Config, id : Text, listId : Text) : async* ListUnpinResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/pinned_lists/{list_id}"
            |> Text.replace(_, #text "{id}", id)
            |> Text.replace(_, #text "{list_id}", listId);

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
            from_candid(_) : ?ListUnpinResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListUnpinResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListUnpinResponse");
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

    /// Update List
    /// Updates the details of a specific List owned by the authenticated user by its ID.
    public func updateLists(config : Config, id : Text, listUpdateRequest : ListUpdateRequest) : async* ListUpdateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/lists/{id}"
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
            method = #put;
            headers;
            body = do ? {
                let jsonValue = ListUpdateRequest.toJSON(listUpdateRequest);
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
            from_candid(_) : ?ListUpdateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListUpdateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListUpdateResponse");
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
        addListsMember;
        createLists;
        deleteLists;
        followList;
        getListsById;
        getListsFollowers;
        getListsMembers;
        getListsPosts;
        getUsersFollowedLists;
        getUsersListMemberships;
        getUsersOwnedLists;
        getUsersPinnedLists;
        pinList;
        removeListsMemberByUserId;
        unfollowList;
        unpinList;
        updateLists;
    };

    public module class ListsApi(config : Config) {
        /// Add List member
        /// Adds a User to a specific List by its ID.
        public func addListsMember(id : Text, listAddUserRequest : ListAddUserRequest) : async ListMutateResponse {
            await* operations__.addListsMember(config, id, listAddUserRequest)
        };

        /// Create List
        /// Creates a new List for the authenticated user.
        public func createLists(listCreateRequest : ListCreateRequest) : async ListCreateResponse {
            await* operations__.createLists(config, listCreateRequest)
        };

        /// Delete List
        /// Deletes a specific List owned by the authenticated user by its ID.
        public func deleteLists(id : Text) : async ListDeleteResponse {
            await* operations__.deleteLists(config, id)
        };

        /// Follow List
        /// Causes the authenticated user to follow a specific List by its ID.
        public func followList(id : Text, listFollowedRequest : ListFollowedRequest) : async ListFollowedResponse {
            await* operations__.followList(config, id, listFollowedRequest)
        };

        /// Get List by ID
        /// Retrieves details of a specific List by its ID.
        public func getListsById(id : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async Get2ListsIdResponse {
            await* operations__.getListsById(config, id, listPeriodfields, expansions, userPeriodfields)
        };

        /// Get List followers
        /// Retrieves a list of Users who follow a specific List by its ID.
        public func getListsFollowers(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2ListsIdFollowersResponse {
            await* operations__.getListsFollowers(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get List members
        /// Retrieves a list of Users who are members of a specific List by its ID.
        public func getListsMembers(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2ListsIdMembersResponse {
            await* operations__.getListsMembers(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get List Posts
        /// Retrieves a list of Posts associated with a specific List by its ID.
        public func getListsPosts(id : Text, maxResults : Nat, paginationToken : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2ListsIdTweetsResponse {
            await* operations__.getListsPosts(config, id, maxResults, paginationToken, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Get followed Lists
        /// Retrieves a list of Lists followed by a specific User by their ID.
        public func getUsersFollowedLists(id : Text, maxResults : Nat, paginationToken : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async Get2UsersIdFollowedListsResponse {
            await* operations__.getUsersFollowedLists(config, id, maxResults, paginationToken, listPeriodfields, expansions, userPeriodfields)
        };

        /// Get List memberships
        /// Retrieves a list of Lists that a specific User is a member of by their ID.
        public func getUsersListMemberships(id : Text, maxResults : Nat, paginationToken : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async Get2UsersIdListMembershipsResponse {
            await* operations__.getUsersListMemberships(config, id, maxResults, paginationToken, listPeriodfields, expansions, userPeriodfields)
        };

        /// Get owned Lists
        /// Retrieves a list of Lists owned by a specific User by their ID.
        public func getUsersOwnedLists(id : Text, maxResults : Nat, paginationToken : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async Get2UsersIdOwnedListsResponse {
            await* operations__.getUsersOwnedLists(config, id, maxResults, paginationToken, listPeriodfields, expansions, userPeriodfields)
        };

        /// Get pinned Lists
        /// Retrieves a list of Lists pinned by the authenticated user.
        public func getUsersPinnedLists(id : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async Get2UsersIdPinnedListsResponse {
            await* operations__.getUsersPinnedLists(config, id, listPeriodfields, expansions, userPeriodfields)
        };

        /// Pin List
        /// Causes the authenticated user to pin a specific List by its ID.
        public func pinList(id : Text, listPinnedRequest : ListPinnedRequest) : async ListPinnedResponse {
            await* operations__.pinList(config, id, listPinnedRequest)
        };

        /// Remove List member
        /// Removes a User from a specific List by its ID and the User’s ID.
        public func removeListsMemberByUserId(id : Text, userId : Text) : async ListMutateResponse {
            await* operations__.removeListsMemberByUserId(config, id, userId)
        };

        /// Unfollow List
        /// Causes the authenticated user to unfollow a specific List by its ID.
        public func unfollowList(id : Text, listId : Text) : async ListFollowedResponse {
            await* operations__.unfollowList(config, id, listId)
        };

        /// Unpin List
        /// Causes the authenticated user to unpin a specific List by its ID.
        public func unpinList(id : Text, listId : Text) : async ListUnpinResponse {
            await* operations__.unpinList(config, id, listId)
        };

        /// Update List
        /// Updates the details of a specific List owned by the authenticated user by its ID.
        public func updateLists(id : Text, listUpdateRequest : ListUpdateRequest) : async ListUpdateResponse {
            await* operations__.updateLists(config, id, listUpdateRequest)
        };

    }
}
