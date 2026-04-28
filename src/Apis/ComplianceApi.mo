// ComplianceApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Nat "mo:core/Nat";
import Iter "mo:core/Iter";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import List "mo:core/List";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON; Candid } "mo:serde-core";
import { type CreateComplianceJobRequest; JSON = CreateComplianceJobRequest } "../Models/CreateComplianceJobRequest";
import { type CreateComplianceJobResponse; JSON = CreateComplianceJobResponse } "../Models/CreateComplianceJobResponse";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type Get2ComplianceJobsIdResponse; JSON = Get2ComplianceJobsIdResponse } "../Models/Get2ComplianceJobsIdResponse";
import { type Get2ComplianceJobsResponse; JSON = Get2ComplianceJobsResponse } "../Models/Get2ComplianceJobsResponse";
import { type GetComplianceJobsComplianceJobFieldsParameterInner; JSON = GetComplianceJobsComplianceJobFieldsParameterInner } "../Models/GetComplianceJobsComplianceJobFieldsParameterInner";
import { type GetComplianceJobsStatusParameter; JSON = GetComplianceJobsStatusParameter } "../Models/GetComplianceJobsStatusParameter";
import { type GetComplianceJobsTypeParameter; JSON = GetComplianceJobsTypeParameter } "../Models/GetComplianceJobsTypeParameter";
import { type LikesComplianceStreamResponse; JSON = LikesComplianceStreamResponse } "../Models/LikesComplianceStreamResponse";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type TweetComplianceStreamResponse; JSON = TweetComplianceStreamResponse } "../Models/TweetComplianceStreamResponse";
import { type TweetLabelStreamResponse; JSON = TweetLabelStreamResponse } "../Models/TweetLabelStreamResponse";
import { type UserComplianceStreamResponse; JSON = UserComplianceStreamResponse } "../Models/UserComplianceStreamResponse";
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


    /// Create Compliance Job
    ///
    /// Creates a new Compliance Job for the specified job type.
    public func createComplianceJobs(config : Config, createComplianceJobRequest : CreateComplianceJobRequest) : async* CreateComplianceJobResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/compliance/jobs";

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
                let candidValue : Candid.Candid = CreateComplianceJobRequest.toCandidValue(createComplianceJobRequest);
                let #ok(jsonText) = JSON.fromCandid(candidValue)
                    else throw Error.reject("Failed to serialize body to JSON");
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
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (CreateComplianceJobResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to CreateComplianceJobResponse");
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
                    switch (JSON.toCandid(responseText)) {
                        case (#ok(c__)) {
                            switch (Error_.fromCandidValue(c__)) {
                                case (?err) " - " # debug_show(err);
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Get Compliance Jobs
    ///
    /// Retrieves a list of Compliance Jobs filtered by job type and optional status.
    public func getComplianceJobs(config : Config, type_ : GetComplianceJobsTypeParameter, status : GetComplianceJobsStatusParameter, complianceJobPeriodfields : [GetComplianceJobsComplianceJobFieldsParameterInner]) : async* Get2ComplianceJobsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/compliance/jobs"
            # "?" # "type=" # GetComplianceJobsTypeParameter.toText(type_) # "&" # "status=" # GetComplianceJobsStatusParameter.toText(status) # "&" # "compliance_job.fields=" # debug_show(complianceJobPeriodfields);

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
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (Get2ComplianceJobsResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to Get2ComplianceJobsResponse");
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
                    switch (JSON.toCandid(responseText)) {
                        case (#ok(c__)) {
                            switch (Error_.fromCandidValue(c__)) {
                                case (?err) " - " # debug_show(err);
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Get Compliance Job by ID
    ///
    /// Retrieves details of a specific Compliance Job by its ID.
    public func getComplianceJobsById(config : Config, id : Text, complianceJobPeriodfields : [GetComplianceJobsComplianceJobFieldsParameterInner]) : async* Get2ComplianceJobsIdResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/compliance/jobs/{id}"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "compliance_job.fields=" # debug_show(complianceJobPeriodfields);

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
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (Get2ComplianceJobsIdResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to Get2ComplianceJobsIdResponse");
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
                    switch (JSON.toCandid(responseText)) {
                        case (#ok(c__)) {
                            switch (Error_.fromCandidValue(c__)) {
                                case (?err) " - " # debug_show(err);
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Stream Post labels
    ///
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
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (TweetLabelStreamResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to TweetLabelStreamResponse");
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
                    switch (JSON.toCandid(responseText)) {
                        case (#ok(c__)) {
                            switch (Error_.fromCandidValue(c__)) {
                                case (?err) " - " # debug_show(err);
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Stream Likes compliance data
    ///
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
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (LikesComplianceStreamResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to LikesComplianceStreamResponse");
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
                    switch (JSON.toCandid(responseText)) {
                        case (#ok(c__)) {
                            switch (Error_.fromCandidValue(c__)) {
                                case (?err) " - " # debug_show(err);
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Stream Posts compliance data
    ///
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
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (TweetComplianceStreamResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to TweetComplianceStreamResponse");
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
                    switch (JSON.toCandid(responseText)) {
                        case (#ok(c__)) {
                            switch (Error_.fromCandidValue(c__)) {
                                case (?err) " - " # debug_show(err);
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Stream Users compliance data
    ///
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
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (UserComplianceStreamResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to UserComplianceStreamResponse");
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
                    switch (JSON.toCandid(responseText)) {
                        case (#ok(c__)) {
                            switch (Error_.fromCandidValue(c__)) {
                                case (?err) " - " # debug_show(err);
                                case null " - " # responseText;
                            };
                        };
                        case (#err(_)) " - " # responseText;
                    };
                } else { "" };
                throw Error.reject("HTTP 0: The request has failed." # errorDetail);
            };

            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };


    let operations__ = {
        createComplianceJobs;
        getComplianceJobs;
        getComplianceJobsById;
        streamLabelsCompliance;
        streamLikesCompliance;
        streamPostsCompliance;
        streamUsersCompliance;
    };

    public module class ComplianceApi(config : Config) {
        /// Create Compliance Job
        ///
        /// Creates a new Compliance Job for the specified job type.
        public func createComplianceJobs(createComplianceJobRequest : CreateComplianceJobRequest) : async CreateComplianceJobResponse {
            await* operations__.createComplianceJobs(config, createComplianceJobRequest)
        };

        /// Get Compliance Jobs
        ///
        /// Retrieves a list of Compliance Jobs filtered by job type and optional status.
        public func getComplianceJobs(type_ : GetComplianceJobsTypeParameter, status : GetComplianceJobsStatusParameter, complianceJobPeriodfields : [GetComplianceJobsComplianceJobFieldsParameterInner]) : async Get2ComplianceJobsResponse {
            await* operations__.getComplianceJobs(config, type_, status, complianceJobPeriodfields)
        };

        /// Get Compliance Job by ID
        ///
        /// Retrieves details of a specific Compliance Job by its ID.
        public func getComplianceJobsById(id : Text, complianceJobPeriodfields : [GetComplianceJobsComplianceJobFieldsParameterInner]) : async Get2ComplianceJobsIdResponse {
            await* operations__.getComplianceJobsById(config, id, complianceJobPeriodfields)
        };

        /// Stream Post labels
        ///
        /// Streams all labeling events applied to Posts.
        public func streamLabelsCompliance(backfillMinutes : Nat, startTime : Text, endTime : Text) : async TweetLabelStreamResponse {
            await* operations__.streamLabelsCompliance(config, backfillMinutes, startTime, endTime)
        };

        /// Stream Likes compliance data
        ///
        /// Streams all compliance data related to Likes for Users.
        public func streamLikesCompliance(backfillMinutes : Nat, startTime : Text, endTime : Text) : async LikesComplianceStreamResponse {
            await* operations__.streamLikesCompliance(config, backfillMinutes, startTime, endTime)
        };

        /// Stream Posts compliance data
        ///
        /// Streams all compliance data related to Posts.
        public func streamPostsCompliance(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text) : async TweetComplianceStreamResponse {
            await* operations__.streamPostsCompliance(config, partition, backfillMinutes, startTime, endTime)
        };

        /// Stream Users compliance data
        ///
        /// Streams all compliance data related to Users.
        public func streamUsersCompliance(partition : Nat, backfillMinutes : Nat, startTime : Text, endTime : Text) : async UserComplianceStreamResponse {
            await* operations__.streamUsersCompliance(config, partition, backfillMinutes, startTime, endTime)
        };

    }
}
