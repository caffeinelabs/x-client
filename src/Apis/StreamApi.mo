// StreamApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ActivityStreamingResponse; JSON = ActivityStreamingResponse } "../Models/ActivityStreamingResponse";
import { type ActivitySubscriptionCreateRequest; JSON = ActivitySubscriptionCreateRequest } "../Models/ActivitySubscriptionCreateRequest";
import { type ActivitySubscriptionCreateResponse; JSON = ActivitySubscriptionCreateResponse } "../Models/ActivitySubscriptionCreateResponse";
import { type AddOrDeleteRulesRequest; JSON = AddOrDeleteRulesRequest } "../Models/AddOrDeleteRulesRequest";
import { type AddOrDeleteRulesResponse; JSON = AddOrDeleteRulesResponse } "../Models/AddOrDeleteRulesResponse";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type FilteredStreamingTweetResponse; JSON = FilteredStreamingTweetResponse } "../Models/FilteredStreamingTweetResponse";
import { type Get2TweetsSample10StreamResponse; JSON = Get2TweetsSample10StreamResponse } "../Models/Get2TweetsSample10StreamResponse";
import { type Get2TweetsSearchStreamRulesCountsResponse; JSON = Get2TweetsSearchStreamRulesCountsResponse } "../Models/Get2TweetsSearchStreamRulesCountsResponse";
import { type GetChatConversationsUserFieldsParameterInner; JSON = GetChatConversationsUserFieldsParameterInner } "../Models/GetChatConversationsUserFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner";
import { type GetListsPostsExpansionsParameterInner; JSON = GetListsPostsExpansionsParameterInner } "../Models/GetListsPostsExpansionsParameterInner";
import { type GetListsPostsPlaceFieldsParameterInner; JSON = GetListsPostsPlaceFieldsParameterInner } "../Models/GetListsPostsPlaceFieldsParameterInner";
import { type GetListsPostsPollFieldsParameterInner; JSON = GetListsPostsPollFieldsParameterInner } "../Models/GetListsPostsPollFieldsParameterInner";
import { type GetRuleCountsRulesCountFieldsParameterInner; JSON = GetRuleCountsRulesCountFieldsParameterInner } "../Models/GetRuleCountsRulesCountFieldsParameterInner";
import { type LikesComplianceStreamResponse; JSON = LikesComplianceStreamResponse } "../Models/LikesComplianceStreamResponse";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type RulesLookupResponse; JSON = RulesLookupResponse } "../Models/RulesLookupResponse";
import { type StreamLikesFirehoseExpansionsParameterInner; JSON = StreamLikesFirehoseExpansionsParameterInner } "../Models/StreamLikesFirehoseExpansionsParameterInner";
import { type StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner; JSON = StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner } "../Models/StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner";
import { type StreamingLikeResponseV2; JSON = StreamingLikeResponseV2 } "../Models/StreamingLikeResponseV2";
import { type StreamingTweetResponse; JSON = StreamingTweetResponse } "../Models/StreamingTweetResponse";
import { type TweetComplianceStreamResponse; JSON = TweetComplianceStreamResponse } "../Models/TweetComplianceStreamResponse";
import { type TweetLabelStreamResponse; JSON = TweetLabelStreamResponse } "../Models/TweetLabelStreamResponse";
import { type UserComplianceStreamResponse; JSON = UserComplianceStreamResponse } "../Models/UserComplianceStreamResponse";
import { type WebhookLinksCreateResponse; JSON = WebhookLinksCreateResponse } "../Models/WebhookLinksCreateResponse";
import { type WebhookLinksDeleteResponse; JSON = WebhookLinksDeleteResponse } "../Models/WebhookLinksDeleteResponse";
import { type WebhookLinksGetResponse; JSON = WebhookLinksGetResponse } "../Models/WebhookLinksGetResponse";
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


    /// Activity Stream
    /// Stream of X Activities
    public func activityStream(config : Config, backfillMinutes : Nat, startTime : Text, endTime : Text) : async* ActivityStreamingResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/activity/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime);

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
            from_candid(_) : ?ActivityStreamingResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ActivityStreamingResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ActivityStreamingResponse");
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

    /// Create X activity subscription
    /// Creates a subscription for an X activity event
    public func createActivitySubscription(config : Config, activitySubscriptionCreateRequest : ActivitySubscriptionCreateRequest) : async* ActivitySubscriptionCreateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/activity/subscriptions";

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
                let jsonValue = ActivitySubscriptionCreateRequest.toJSON(activitySubscriptionCreateRequest);
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
            from_candid(_) : ?ActivitySubscriptionCreateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ActivitySubscriptionCreateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ActivitySubscriptionCreateResponse");
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

    /// Create stream link
    /// Creates a link to deliver FilteredStream events to the given webhook.
    public func createWebhooksStreamLink(config : Config, webhookId : Text, tweetPeriodfields : Text, expansions : Text, mediaPeriodfields : Text, pollPeriodfields : Text, userPeriodfields : Text, placePeriodfields : Text) : async* WebhookLinksCreateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/search/webhooks/{webhook_id}"
            |> Text.replace(_, #text "{webhook_id}", webhookId)
            # "?" # "tweet.fields=" # tweetPeriodfields # "&" # "expansions=" # expansions # "&" # "media.fields=" # mediaPeriodfields # "&" # "poll.fields=" # pollPeriodfields # "&" # "user.fields=" # userPeriodfields # "&" # "place.fields=" # placePeriodfields;

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
            from_candid(_) : ?WebhookLinksCreateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (WebhookLinksCreateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to WebhookLinksCreateResponse");
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

    /// Delete stream link
    /// Deletes a link from FilteredStream events to the given webhook.
    public func deleteWebhooksStreamLink(config : Config, webhookId : Text) : async* WebhookLinksDeleteResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/search/webhooks/{webhook_id}"
            |> Text.replace(_, #text "{webhook_id}", webhookId);

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
            from_candid(_) : ?WebhookLinksDeleteResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (WebhookLinksDeleteResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to WebhookLinksDeleteResponse");
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

    /// Get stream rule counts
    /// Retrieves the count of rules in the active rule set for the filtered stream.
    public func getRuleCounts(config : Config, rulesCountPeriodfields : [GetRuleCountsRulesCountFieldsParameterInner]) : async* Get2TweetsSearchStreamRulesCountsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/search/stream/rules/counts"
            # "?" # "rules_count.fields=" # debug_show(rulesCountPeriodfields);

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
            from_candid(_) : ?Get2TweetsSearchStreamRulesCountsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2TweetsSearchStreamRulesCountsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2TweetsSearchStreamRulesCountsResponse");
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

    /// Get stream rules
    /// Retrieves the active rule set or a subset of rules for the filtered stream.
    public func getRules(config : Config, ids : [Text], maxResults : Nat, paginationToken : Text) : async* RulesLookupResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/search/stream/rules"
            # "?" # "ids=" # debug_show(ids) # "&" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken;

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
            from_candid(_) : ?RulesLookupResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (RulesLookupResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to RulesLookupResponse");
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

    /// Get stream links
    /// Get a list of webhook links associated with a filtered stream ruleset.
    public func getWebhooksStreamLinks(config : Config) : async* WebhookLinksGetResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/search/webhooks";

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
            from_candid(_) : ?WebhookLinksGetResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (WebhookLinksGetResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to WebhookLinksGetResponse");
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

    /// Stream Post labels
    /// Streams all labeling events applied to Posts.
    public func streamLabelsCompliance(config : Config, backfillMinutes : Nat, startTime : Text, endTime : Text) : async* TweetLabelStreamResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/label/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime);

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
            from_candid(_) : ?TweetLabelStreamResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (TweetLabelStreamResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to TweetLabelStreamResponse");
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

    /// Stream Likes compliance data
    /// Streams all compliance data related to Likes for Users.
    public func streamLikesCompliance(config : Config, backfillMinutes : Nat, startTime : Text, endTime : Text) : async* LikesComplianceStreamResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/likes/compliance/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime);

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
            from_candid(_) : ?LikesComplianceStreamResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (LikesComplianceStreamResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to LikesComplianceStreamResponse");
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

    /// Stream all Likes
    /// Streams all public Likes in real-time.
    public func streamLikesFirehose(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, likeWithTweetAuthorPeriodfields : [StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner], expansions : [StreamLikesFirehoseExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* StreamingLikeResponseV2 {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/likes/firehose/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "like_with_tweet_author.fields=" # debug_show(likeWithTweetAuthorPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?StreamingLikeResponseV2.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (StreamingLikeResponseV2.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to StreamingLikeResponseV2");
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

    /// Stream sampled Likes
    /// Streams a 10% sample of public Likes in real-time.
    public func streamLikesSample10(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, likeWithTweetAuthorPeriodfields : [StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner], expansions : [StreamLikesFirehoseExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* StreamingLikeResponseV2 {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/likes/sample10/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "like_with_tweet_author.fields=" # debug_show(likeWithTweetAuthorPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?StreamingLikeResponseV2.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (StreamingLikeResponseV2.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to StreamingLikeResponseV2");
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

    /// Stream filtered Posts
    /// Streams Posts in real-time matching the active rule set.
    public func streamPosts(config : Config, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* FilteredStreamingTweetResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/search/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?FilteredStreamingTweetResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (FilteredStreamingTweetResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to FilteredStreamingTweetResponse");
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

    /// Stream Posts compliance data
    /// Streams all compliance data related to Posts.
    public func streamPostsCompliance(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text) : async* TweetComplianceStreamResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/compliance/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime);

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
            from_candid(_) : ?TweetComplianceStreamResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (TweetComplianceStreamResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to TweetComplianceStreamResponse");
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

    /// Stream all Posts
    /// Streams all public Posts in real-time.
    public func streamPostsFirehose(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* StreamingTweetResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/firehose/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?StreamingTweetResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (StreamingTweetResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to StreamingTweetResponse");
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

    /// Stream English Posts
    /// Streams all public English-language Posts in real-time.
    public func streamPostsFirehoseEn(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* StreamingTweetResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/firehose/stream/lang/en"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?StreamingTweetResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (StreamingTweetResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to StreamingTweetResponse");
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

    /// Stream Japanese Posts
    /// Streams all public Japanese-language Posts in real-time.
    public func streamPostsFirehoseJa(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* StreamingTweetResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/firehose/stream/lang/ja"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?StreamingTweetResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (StreamingTweetResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to StreamingTweetResponse");
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

    /// Stream Korean Posts
    /// Streams all public Korean-language Posts in real-time.
    public func streamPostsFirehoseKo(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* StreamingTweetResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/firehose/stream/lang/ko"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?StreamingTweetResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (StreamingTweetResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to StreamingTweetResponse");
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

    /// Stream Portuguese Posts
    /// Streams all public Portuguese-language Posts in real-time.
    public func streamPostsFirehosePt(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* StreamingTweetResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/firehose/stream/lang/pt"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?StreamingTweetResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (StreamingTweetResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to StreamingTweetResponse");
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

    /// Stream sampled Posts
    /// Streams a 1% sample of public Posts in real-time.
    public func streamPostsSample(config : Config, backfillMinutes : Nat, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* StreamingTweetResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/sample/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?StreamingTweetResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (StreamingTweetResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to StreamingTweetResponse");
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

    /// Stream 10% sampled Posts
    /// Streams a 10% sample of public Posts in real-time.
    public func streamPostsSample10(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2TweetsSample10StreamResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/sample10/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?Get2TweetsSample10StreamResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2TweetsSample10StreamResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2TweetsSample10StreamResponse");
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

    /// Stream Users compliance data
    /// Streams all compliance data related to Users.
    public func streamUsersCompliance(config : Config, partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text) : async* UserComplianceStreamResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/compliance/stream"
            # "?" # "backfill_minutes=" # Int.toText(backfillMinutes) # "&" # "partition=" # Int.toText(partition) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime);

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
            from_candid(_) : ?UserComplianceStreamResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UserComplianceStreamResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UserComplianceStreamResponse");
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

    /// Update stream rules
    /// Adds or deletes rules from the active rule set for the filtered stream.
    public func updateRules(config : Config, addOrDeleteRulesRequest : AddOrDeleteRulesRequest, dryRun : Bool, deleteAll : Bool) : async* AddOrDeleteRulesResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/search/stream/rules"
            # "?" # "dry_run=" # debug_show(dryRun) # "&" # "delete_all=" # debug_show(deleteAll);

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
                let jsonValue = AddOrDeleteRulesRequest.toJSON(addOrDeleteRulesRequest);
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
            from_candid(_) : ?AddOrDeleteRulesResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (AddOrDeleteRulesResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to AddOrDeleteRulesResponse");
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
        activityStream;
        createActivitySubscription;
        createWebhooksStreamLink;
        deleteWebhooksStreamLink;
        getRuleCounts;
        getRules;
        getWebhooksStreamLinks;
        streamLabelsCompliance;
        streamLikesCompliance;
        streamLikesFirehose;
        streamLikesSample10;
        streamPosts;
        streamPostsCompliance;
        streamPostsFirehose;
        streamPostsFirehoseEn;
        streamPostsFirehoseJa;
        streamPostsFirehoseKo;
        streamPostsFirehosePt;
        streamPostsSample;
        streamPostsSample10;
        streamUsersCompliance;
        updateRules;
    };

    public module class StreamApi(config : Config) {
        /// Activity Stream
        /// Stream of X Activities
        public func activityStream(backfillMinutes : Nat, startTime : Text, endTime : Text) : async ActivityStreamingResponse {
            await* operations__.activityStream(config, backfillMinutes, startTime, endTime)
        };

        /// Create X activity subscription
        /// Creates a subscription for an X activity event
        public func createActivitySubscription(activitySubscriptionCreateRequest : ActivitySubscriptionCreateRequest) : async ActivitySubscriptionCreateResponse {
            await* operations__.createActivitySubscription(config, activitySubscriptionCreateRequest)
        };

        /// Create stream link
        /// Creates a link to deliver FilteredStream events to the given webhook.
        public func createWebhooksStreamLink(webhookId : Text, tweetPeriodfields : Text, expansions : Text, mediaPeriodfields : Text, pollPeriodfields : Text, userPeriodfields : Text, placePeriodfields : Text) : async WebhookLinksCreateResponse {
            await* operations__.createWebhooksStreamLink(config, webhookId, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Delete stream link
        /// Deletes a link from FilteredStream events to the given webhook.
        public func deleteWebhooksStreamLink(webhookId : Text) : async WebhookLinksDeleteResponse {
            await* operations__.deleteWebhooksStreamLink(config, webhookId)
        };

        /// Get stream rule counts
        /// Retrieves the count of rules in the active rule set for the filtered stream.
        public func getRuleCounts(rulesCountPeriodfields : [GetRuleCountsRulesCountFieldsParameterInner]) : async Get2TweetsSearchStreamRulesCountsResponse {
            await* operations__.getRuleCounts(config, rulesCountPeriodfields)
        };

        /// Get stream rules
        /// Retrieves the active rule set or a subset of rules for the filtered stream.
        public func getRules(ids : [Text], maxResults : Nat, paginationToken : Text) : async RulesLookupResponse {
            await* operations__.getRules(config, ids, maxResults, paginationToken)
        };

        /// Get stream links
        /// Get a list of webhook links associated with a filtered stream ruleset.
        public func getWebhooksStreamLinks() : async WebhookLinksGetResponse {
            await* operations__.getWebhooksStreamLinks(config)
        };

        /// Stream Post labels
        /// Streams all labeling events applied to Posts.
        public func streamLabelsCompliance(backfillMinutes : Nat, startTime : Text, endTime : Text) : async TweetLabelStreamResponse {
            await* operations__.streamLabelsCompliance(config, backfillMinutes, startTime, endTime)
        };

        /// Stream Likes compliance data
        /// Streams all compliance data related to Likes for Users.
        public func streamLikesCompliance(backfillMinutes : Nat, startTime : Text, endTime : Text) : async LikesComplianceStreamResponse {
            await* operations__.streamLikesCompliance(config, backfillMinutes, startTime, endTime)
        };

        /// Stream all Likes
        /// Streams all public Likes in real-time.
        public func streamLikesFirehose(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, likeWithTweetAuthorPeriodfields : [StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner], expansions : [StreamLikesFirehoseExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async StreamingLikeResponseV2 {
            await* operations__.streamLikesFirehose(config, partition, backfillMinutes, startTime, endTime, likeWithTweetAuthorPeriodfields, expansions, userPeriodfields, tweetPeriodfields)
        };

        /// Stream sampled Likes
        /// Streams a 10% sample of public Likes in real-time.
        public func streamLikesSample10(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, likeWithTweetAuthorPeriodfields : [StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner], expansions : [StreamLikesFirehoseExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async StreamingLikeResponseV2 {
            await* operations__.streamLikesSample10(config, partition, backfillMinutes, startTime, endTime, likeWithTweetAuthorPeriodfields, expansions, userPeriodfields, tweetPeriodfields)
        };

        /// Stream filtered Posts
        /// Streams Posts in real-time matching the active rule set.
        public func streamPosts(backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async FilteredStreamingTweetResponse {
            await* operations__.streamPosts(config, backfillMinutes, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Stream Posts compliance data
        /// Streams all compliance data related to Posts.
        public func streamPostsCompliance(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text) : async TweetComplianceStreamResponse {
            await* operations__.streamPostsCompliance(config, partition, backfillMinutes, startTime, endTime)
        };

        /// Stream all Posts
        /// Streams all public Posts in real-time.
        public func streamPostsFirehose(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async StreamingTweetResponse {
            await* operations__.streamPostsFirehose(config, partition, backfillMinutes, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Stream English Posts
        /// Streams all public English-language Posts in real-time.
        public func streamPostsFirehoseEn(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async StreamingTweetResponse {
            await* operations__.streamPostsFirehoseEn(config, partition, backfillMinutes, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Stream Japanese Posts
        /// Streams all public Japanese-language Posts in real-time.
        public func streamPostsFirehoseJa(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async StreamingTweetResponse {
            await* operations__.streamPostsFirehoseJa(config, partition, backfillMinutes, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Stream Korean Posts
        /// Streams all public Korean-language Posts in real-time.
        public func streamPostsFirehoseKo(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async StreamingTweetResponse {
            await* operations__.streamPostsFirehoseKo(config, partition, backfillMinutes, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Stream Portuguese Posts
        /// Streams all public Portuguese-language Posts in real-time.
        public func streamPostsFirehosePt(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async StreamingTweetResponse {
            await* operations__.streamPostsFirehosePt(config, partition, backfillMinutes, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Stream sampled Posts
        /// Streams a 1% sample of public Posts in real-time.
        public func streamPostsSample(backfillMinutes : Nat, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async StreamingTweetResponse {
            await* operations__.streamPostsSample(config, backfillMinutes, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Stream 10% sampled Posts
        /// Streams a 10% sample of public Posts in real-time.
        public func streamPostsSample10(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2TweetsSample10StreamResponse {
            await* operations__.streamPostsSample10(config, partition, backfillMinutes, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Stream Users compliance data
        /// Streams all compliance data related to Users.
        public func streamUsersCompliance(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text) : async UserComplianceStreamResponse {
            await* operations__.streamUsersCompliance(config, partition, backfillMinutes, startTime, endTime)
        };

        /// Update stream rules
        /// Adds or deletes rules from the active rule set for the filtered stream.
        public func updateRules(addOrDeleteRulesRequest : AddOrDeleteRulesRequest, dryRun : Bool, deleteAll : Bool) : async AddOrDeleteRulesResponse {
            await* operations__.updateRules(config, addOrDeleteRulesRequest, dryRun, deleteAll)
        };

    }
}
