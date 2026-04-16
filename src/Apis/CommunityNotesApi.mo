// CommunityNotesApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde";
import { type CreateNoteRequest; JSON = CreateNoteRequest } "../Models/CreateNoteRequest";
import { type CreateNoteResponse; JSON = CreateNoteResponse } "../Models/CreateNoteResponse";
import { type DeleteNoteResponse; JSON = DeleteNoteResponse } "../Models/DeleteNoteResponse";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type EvaluateNoteRequest; JSON = EvaluateNoteRequest } "../Models/EvaluateNoteRequest";
import { type EvaluateNoteResponse; JSON = EvaluateNoteResponse } "../Models/EvaluateNoteResponse";
import { type Get2NotesSearchNotesWrittenResponse; JSON = Get2NotesSearchNotesWrittenResponse } "../Models/Get2NotesSearchNotesWrittenResponse";
import { type Get2NotesSearchPostsEligibleForNotesResponse; JSON = Get2NotesSearchPostsEligibleForNotesResponse } "../Models/Get2NotesSearchPostsEligibleForNotesResponse";
import { type GetChatConversationsUserFieldsParameterInner; JSON = GetChatConversationsUserFieldsParameterInner } "../Models/GetChatConversationsUserFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner";
import { type GetListsPostsExpansionsParameterInner; JSON = GetListsPostsExpansionsParameterInner } "../Models/GetListsPostsExpansionsParameterInner";
import { type GetListsPostsPlaceFieldsParameterInner; JSON = GetListsPostsPlaceFieldsParameterInner } "../Models/GetListsPostsPlaceFieldsParameterInner";
import { type GetListsPostsPollFieldsParameterInner; JSON = GetListsPostsPollFieldsParameterInner } "../Models/GetListsPostsPollFieldsParameterInner";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type SearchCommunityNotesWrittenNoteFieldsParameterInner; JSON = SearchCommunityNotesWrittenNoteFieldsParameterInner } "../Models/SearchCommunityNotesWrittenNoteFieldsParameterInner";
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


    /// Create a Community Note
    ///
    /// Creates a community note endpoint for LLM use case.
    public func createCommunityNotes(config : Config, createNoteRequest : CreateNoteRequest) : async* CreateNoteResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/notes";

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
                let jsonValue = CreateNoteRequest.toJSON(createNoteRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, ["info", "post_id", "test_mode"], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?CreateNoteResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (CreateNoteResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to CreateNoteResponse");
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

    /// Delete a Community Note
    ///
    /// Deletes a community note.
    public func deleteCommunityNotes(config : Config, id : Text) : async* DeleteNoteResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/notes/{id}"
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
            from_candid(_) : ?DeleteNoteResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (DeleteNoteResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to DeleteNoteResponse");
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

    /// Evaluate a Community Note
    ///
    /// Endpoint to evaluate a community note.
    public func evaluateCommunityNotes(config : Config, evaluateNoteRequest : EvaluateNoteRequest) : async* EvaluateNoteResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/evaluate_note";

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
                let jsonValue = EvaluateNoteRequest.toJSON(evaluateNoteRequest);
                let candidBlob = to_candid(jsonValue);
                let #ok(jsonText) = JSON.toText(candidBlob, ["note_text", "post_id"], null) else throw Error.reject("Failed to serialize to JSON");
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
            from_candid(_) : ?EvaluateNoteResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (EvaluateNoteResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to EvaluateNoteResponse");
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

    /// Search for Community Notes Written
    ///
    /// Returns all the community notes written by the user.
    public func searchCommunityNotesWritten(config : Config, testMode : Bool, paginationToken : Text, maxResults : Nat, notePeriodfields : [SearchCommunityNotesWrittenNoteFieldsParameterInner]) : async* Get2NotesSearchNotesWrittenResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/notes/search/notes_written"
            # "?" # "test_mode=" # debug_show(testMode) # "&" # "pagination_token=" # paginationToken # "&" # "max_results=" # Int.toText(maxResults) # "&" # "note.fields=" # debug_show(notePeriodfields);

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
            from_candid(_) : ?Get2NotesSearchNotesWrittenResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2NotesSearchNotesWrittenResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2NotesSearchNotesWrittenResponse");
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

    /// Search for Posts Eligible for Community Notes
    ///
    /// Returns all the posts that are eligible for community notes.
    public func searchEligiblePosts(config : Config, testMode : Bool, paginationToken : Text, maxResults : Nat, postSelection : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2NotesSearchPostsEligibleForNotesResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/notes/search/posts_eligible_for_notes"
            # "?" # "test_mode=" # debug_show(testMode) # "&" # "pagination_token=" # paginationToken # "&" # "max_results=" # Int.toText(maxResults) # "&" # "post_selection=" # postSelection # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?Get2NotesSearchPostsEligibleForNotesResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2NotesSearchPostsEligibleForNotesResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2NotesSearchPostsEligibleForNotesResponse");
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
        createCommunityNotes;
        deleteCommunityNotes;
        evaluateCommunityNotes;
        searchCommunityNotesWritten;
        searchEligiblePosts;
    };

    public module class CommunityNotesApi(config : Config) {
        /// Create a Community Note
        ///
        /// Creates a community note endpoint for LLM use case.
        public func createCommunityNotes(createNoteRequest : CreateNoteRequest) : async CreateNoteResponse {
            await* operations__.createCommunityNotes(config, createNoteRequest)
        };

        /// Delete a Community Note
        ///
        /// Deletes a community note.
        public func deleteCommunityNotes(id : Text) : async DeleteNoteResponse {
            await* operations__.deleteCommunityNotes(config, id)
        };

        /// Evaluate a Community Note
        ///
        /// Endpoint to evaluate a community note.
        public func evaluateCommunityNotes(evaluateNoteRequest : EvaluateNoteRequest) : async EvaluateNoteResponse {
            await* operations__.evaluateCommunityNotes(config, evaluateNoteRequest)
        };

        /// Search for Community Notes Written
        ///
        /// Returns all the community notes written by the user.
        public func searchCommunityNotesWritten(testMode : Bool, paginationToken : Text, maxResults : Nat, notePeriodfields : [SearchCommunityNotesWrittenNoteFieldsParameterInner]) : async Get2NotesSearchNotesWrittenResponse {
            await* operations__.searchCommunityNotesWritten(config, testMode, paginationToken, maxResults, notePeriodfields)
        };

        /// Search for Posts Eligible for Community Notes
        ///
        /// Returns all the posts that are eligible for community notes.
        public func searchEligiblePosts(testMode : Bool, paginationToken : Text, maxResults : Nat, postSelection : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2NotesSearchPostsEligibleForNotesResponse {
            await* operations__.searchEligiblePosts(config, testMode, paginationToken, maxResults, postSelection, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

    }
}
