// SpacesApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type Get2SpacesByCreatorIdsResponse; JSON = Get2SpacesByCreatorIdsResponse } "../Models/Get2SpacesByCreatorIdsResponse";
import { type Get2SpacesIdBuyersResponse; JSON = Get2SpacesIdBuyersResponse } "../Models/Get2SpacesIdBuyersResponse";
import { type Get2SpacesIdResponse; JSON = Get2SpacesIdResponse } "../Models/Get2SpacesIdResponse";
import { type Get2SpacesIdTweetsResponse; JSON = Get2SpacesIdTweetsResponse } "../Models/Get2SpacesIdTweetsResponse";
import { type Get2SpacesResponse; JSON = Get2SpacesResponse } "../Models/Get2SpacesResponse";
import { type Get2SpacesSearchResponse; JSON = Get2SpacesSearchResponse } "../Models/Get2SpacesSearchResponse";
import { type GetChatConversationsUserFieldsParameterInner; JSON = GetChatConversationsUserFieldsParameterInner } "../Models/GetChatConversationsUserFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner";
import { type GetListsFollowersExpansionsParameterInner; JSON = GetListsFollowersExpansionsParameterInner } "../Models/GetListsFollowersExpansionsParameterInner";
import { type GetListsPostsExpansionsParameterInner; JSON = GetListsPostsExpansionsParameterInner } "../Models/GetListsPostsExpansionsParameterInner";
import { type GetListsPostsPlaceFieldsParameterInner; JSON = GetListsPostsPlaceFieldsParameterInner } "../Models/GetListsPostsPlaceFieldsParameterInner";
import { type GetListsPostsPollFieldsParameterInner; JSON = GetListsPostsPollFieldsParameterInner } "../Models/GetListsPostsPollFieldsParameterInner";
import { type GetSpacesByIdsExpansionsParameterInner; JSON = GetSpacesByIdsExpansionsParameterInner } "../Models/GetSpacesByIdsExpansionsParameterInner";
import { type GetSpacesByIdsSpaceFieldsParameterInner; JSON = GetSpacesByIdsSpaceFieldsParameterInner } "../Models/GetSpacesByIdsSpaceFieldsParameterInner";
import { type GetSpacesByIdsTopicFieldsParameterInner; JSON = GetSpacesByIdsTopicFieldsParameterInner } "../Models/GetSpacesByIdsTopicFieldsParameterInner";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type SearchSpacesStateParameter; JSON = SearchSpacesStateParameter } "../Models/SearchSpacesStateParameter";
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


    /// Get Space ticket buyers
    ///
    /// Retrieves a list of Users who purchased tickets to a specific Space by its ID.
    public func getSpacesBuyers(config : Config, id : Text, paginationToken : Text, maxResults : Nat, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2SpacesIdBuyersResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/spaces/{id}/buyers"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "pagination_token=" # paginationToken # "&" # "max_results=" # Int.toText(maxResults) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2SpacesIdBuyersResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2SpacesIdBuyersResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2SpacesIdBuyersResponse");
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

    /// Get Spaces by creator IDs
    ///
    /// Retrieves details of Spaces created by specified User IDs.
    public func getSpacesByCreatorIds(config : Config, userIds : [Text], spacePeriodfields : [GetSpacesByIdsSpaceFieldsParameterInner], expansions : [GetSpacesByIdsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], topicPeriodfields : [GetSpacesByIdsTopicFieldsParameterInner]) : async* Get2SpacesByCreatorIdsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/spaces/by/creator_ids"
            # "?" # "user_ids=" # debug_show(userIds) # "&" # "space.fields=" # debug_show(spacePeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "topic.fields=" # debug_show(topicPeriodfields);

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
            from_candid(_) : ?Get2SpacesByCreatorIdsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2SpacesByCreatorIdsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2SpacesByCreatorIdsResponse");
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

    /// Get space by ID
    ///
    /// Retrieves details of a specific space by its ID.
    public func getSpacesById(config : Config, id : Text, spacePeriodfields : [GetSpacesByIdsSpaceFieldsParameterInner], expansions : [GetSpacesByIdsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], topicPeriodfields : [GetSpacesByIdsTopicFieldsParameterInner]) : async* Get2SpacesIdResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/spaces/{id}"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "space.fields=" # debug_show(spacePeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "topic.fields=" # debug_show(topicPeriodfields);

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
            from_candid(_) : ?Get2SpacesIdResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2SpacesIdResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2SpacesIdResponse");
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

    /// Get Spaces by IDs
    ///
    /// Retrieves details of multiple Spaces by their IDs.
    public func getSpacesByIds(config : Config, ids : [Text], spacePeriodfields : [GetSpacesByIdsSpaceFieldsParameterInner], expansions : [GetSpacesByIdsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], topicPeriodfields : [GetSpacesByIdsTopicFieldsParameterInner]) : async* Get2SpacesResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/spaces"
            # "?" # "ids=" # debug_show(ids) # "&" # "space.fields=" # debug_show(spacePeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "topic.fields=" # debug_show(topicPeriodfields);

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
            from_candid(_) : ?Get2SpacesResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2SpacesResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2SpacesResponse");
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

    /// Get Space Posts
    ///
    /// Retrieves a list of Posts shared in a specific Space by its ID.
    public func getSpacesPosts(config : Config, id : Text, maxResults : Nat, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2SpacesIdTweetsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/spaces/{id}/tweets"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?Get2SpacesIdTweetsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2SpacesIdTweetsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2SpacesIdTweetsResponse");
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

    /// Search Spaces
    ///
    /// Retrieves a list of Spaces matching the specified search query.
    public func searchSpaces(config : Config, query_ : Text, state : SearchSpacesStateParameter, maxResults : Nat, spacePeriodfields : [GetSpacesByIdsSpaceFieldsParameterInner], expansions : [GetSpacesByIdsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], topicPeriodfields : [GetSpacesByIdsTopicFieldsParameterInner]) : async* Get2SpacesSearchResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/spaces/search"
            # "?" # "query=" # query_ # "&" # "state=" # SearchSpacesStateParameter.toJSON(state) # "&" # "max_results=" # Int.toText(maxResults) # "&" # "space.fields=" # debug_show(spacePeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "topic.fields=" # debug_show(topicPeriodfields);

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
            from_candid(_) : ?Get2SpacesSearchResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2SpacesSearchResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2SpacesSearchResponse");
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
        getSpacesBuyers;
        getSpacesByCreatorIds;
        getSpacesById;
        getSpacesByIds;
        getSpacesPosts;
        searchSpaces;
    };

    public module class SpacesApi(config : Config) {
        /// Get Space ticket buyers
        ///
        /// Retrieves a list of Users who purchased tickets to a specific Space by its ID.
        public func getSpacesBuyers(id : Text, paginationToken : Text, maxResults : Nat, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2SpacesIdBuyersResponse {
            await* operations__.getSpacesBuyers(config, id, paginationToken, maxResults, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get Spaces by creator IDs
        ///
        /// Retrieves details of Spaces created by specified User IDs.
        public func getSpacesByCreatorIds(userIds : [Text], spacePeriodfields : [GetSpacesByIdsSpaceFieldsParameterInner], expansions : [GetSpacesByIdsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], topicPeriodfields : [GetSpacesByIdsTopicFieldsParameterInner]) : async Get2SpacesByCreatorIdsResponse {
            await* operations__.getSpacesByCreatorIds(config, userIds, spacePeriodfields, expansions, userPeriodfields, topicPeriodfields)
        };

        /// Get space by ID
        ///
        /// Retrieves details of a specific space by its ID.
        public func getSpacesById(id : Text, spacePeriodfields : [GetSpacesByIdsSpaceFieldsParameterInner], expansions : [GetSpacesByIdsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], topicPeriodfields : [GetSpacesByIdsTopicFieldsParameterInner]) : async Get2SpacesIdResponse {
            await* operations__.getSpacesById(config, id, spacePeriodfields, expansions, userPeriodfields, topicPeriodfields)
        };

        /// Get Spaces by IDs
        ///
        /// Retrieves details of multiple Spaces by their IDs.
        public func getSpacesByIds(ids : [Text], spacePeriodfields : [GetSpacesByIdsSpaceFieldsParameterInner], expansions : [GetSpacesByIdsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], topicPeriodfields : [GetSpacesByIdsTopicFieldsParameterInner]) : async Get2SpacesResponse {
            await* operations__.getSpacesByIds(config, ids, spacePeriodfields, expansions, userPeriodfields, topicPeriodfields)
        };

        /// Get Space Posts
        ///
        /// Retrieves a list of Posts shared in a specific Space by its ID.
        public func getSpacesPosts(id : Text, maxResults : Nat, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2SpacesIdTweetsResponse {
            await* operations__.getSpacesPosts(config, id, maxResults, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Search Spaces
        ///
        /// Retrieves a list of Spaces matching the specified search query.
        public func searchSpaces(query_ : Text, state : SearchSpacesStateParameter, maxResults : Nat, spacePeriodfields : [GetSpacesByIdsSpaceFieldsParameterInner], expansions : [GetSpacesByIdsExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], topicPeriodfields : [GetSpacesByIdsTopicFieldsParameterInner]) : async Get2SpacesSearchResponse {
            await* operations__.searchSpaces(config, query_, state, maxResults, spacePeriodfields, expansions, userPeriodfields, topicPeriodfields)
        };

    }
}
