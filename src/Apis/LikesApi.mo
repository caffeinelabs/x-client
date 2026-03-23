// LikesApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type GetChatConversationsUserFieldsParameterInner; JSON = GetChatConversationsUserFieldsParameterInner } "../Models/GetChatConversationsUserFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type StreamLikesFirehoseExpansionsParameterInner; JSON = StreamLikesFirehoseExpansionsParameterInner } "../Models/StreamLikesFirehoseExpansionsParameterInner";
import { type StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner; JSON = StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner } "../Models/StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner";
import { type StreamingLikeResponseV2; JSON = StreamingLikeResponseV2 } "../Models/StreamingLikeResponseV2";
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


    let operations__ = {
        streamLikesFirehose;
        streamLikesSample10;
    };

    public module class LikesApi(config : Config) {
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

    }
}
