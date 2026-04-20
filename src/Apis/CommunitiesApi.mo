// CommunitiesApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON; Candid } "mo:serde-core";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type Get2CommunitiesIdResponse; JSON = Get2CommunitiesIdResponse } "../Models/Get2CommunitiesIdResponse";
import { type Get2CommunitiesSearchResponse; JSON = Get2CommunitiesSearchResponse } "../Models/Get2CommunitiesSearchResponse";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type SearchCommunitiesCommunityFieldsParameterInner; JSON = SearchCommunitiesCommunityFieldsParameterInner } "../Models/SearchCommunitiesCommunityFieldsParameterInner";
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


    /// Get Community by ID
    ///
    /// Retrieves details of a specific Community by its ID.
    public func getCommunitiesById(config : Config, id : Text, communityPeriodfields : [SearchCommunitiesCommunityFieldsParameterInner]) : async* Get2CommunitiesIdResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/communities/{id}"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "community.fields=" # debug_show(communityPeriodfields);

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
            from_candid(_) : ?Get2CommunitiesIdResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2CommunitiesIdResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2CommunitiesIdResponse");
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

    /// Search Communities
    ///
    /// Retrieves a list of Communities matching the specified search query.
    public func searchCommunities(config : Config, query_ : Text, maxResults : Nat, nextToken : Text, paginationToken : Text, communityPeriodfields : [SearchCommunitiesCommunityFieldsParameterInner]) : async* Get2CommunitiesSearchResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/communities/search"
            # "?" # "query=" # query_ # "&" # "max_results=" # Int.toText(maxResults) # "&" # "next_token=" # nextToken # "&" # "pagination_token=" # paginationToken # "&" # "community.fields=" # debug_show(communityPeriodfields);

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
            from_candid(_) : ?Get2CommunitiesSearchResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2CommunitiesSearchResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2CommunitiesSearchResponse");
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
        getCommunitiesById;
        searchCommunities;
    };

    public module class CommunitiesApi(config : Config) {
        /// Get Community by ID
        ///
        /// Retrieves details of a specific Community by its ID.
        public func getCommunitiesById(id : Text, communityPeriodfields : [SearchCommunitiesCommunityFieldsParameterInner]) : async Get2CommunitiesIdResponse {
            await* operations__.getCommunitiesById(config, id, communityPeriodfields)
        };

        /// Search Communities
        ///
        /// Retrieves a list of Communities matching the specified search query.
        public func searchCommunities(query_ : Text, maxResults : Nat, nextToken : Text, paginationToken : Text, communityPeriodfields : [SearchCommunitiesCommunityFieldsParameterInner]) : async Get2CommunitiesSearchResponse {
            await* operations__.searchCommunities(config, query_, maxResults, nextToken, paginationToken, communityPeriodfields)
        };

    }
}
