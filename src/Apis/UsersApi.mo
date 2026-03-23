// UsersApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type BookmarkAddRequest; JSON = BookmarkAddRequest } "../Models/BookmarkAddRequest";
import { type BookmarkFolderPostsResponse; JSON = BookmarkFolderPostsResponse } "../Models/BookmarkFolderPostsResponse";
import { type BookmarkFoldersResponse; JSON = BookmarkFoldersResponse } "../Models/BookmarkFoldersResponse";
import { type BookmarkMutationResponse; JSON = BookmarkMutationResponse } "../Models/BookmarkMutationResponse";
import { type Error_; JSON = Error_ } "../Models/Error_";
import { type Get2ListsIdFollowersResponse; JSON = Get2ListsIdFollowersResponse } "../Models/Get2ListsIdFollowersResponse";
import { type Get2ListsIdMembersResponse; JSON = Get2ListsIdMembersResponse } "../Models/Get2ListsIdMembersResponse";
import { type Get2TweetsIdLikingUsersResponse; JSON = Get2TweetsIdLikingUsersResponse } "../Models/Get2TweetsIdLikingUsersResponse";
import { type Get2TweetsIdRetweetedByResponse; JSON = Get2TweetsIdRetweetedByResponse } "../Models/Get2TweetsIdRetweetedByResponse";
import { type Get2UsersByResponse; JSON = Get2UsersByResponse } "../Models/Get2UsersByResponse";
import { type Get2UsersByUsernameUsernameResponse; JSON = Get2UsersByUsernameUsernameResponse } "../Models/Get2UsersByUsernameUsernameResponse";
import { type Get2UsersIdAffiliatesResponse; JSON = Get2UsersIdAffiliatesResponse } "../Models/Get2UsersIdAffiliatesResponse";
import { type Get2UsersIdBlockingResponse; JSON = Get2UsersIdBlockingResponse } "../Models/Get2UsersIdBlockingResponse";
import { type Get2UsersIdBookmarksResponse; JSON = Get2UsersIdBookmarksResponse } "../Models/Get2UsersIdBookmarksResponse";
import { type Get2UsersIdFollowedListsResponse; JSON = Get2UsersIdFollowedListsResponse } "../Models/Get2UsersIdFollowedListsResponse";
import { type Get2UsersIdFollowersResponse; JSON = Get2UsersIdFollowersResponse } "../Models/Get2UsersIdFollowersResponse";
import { type Get2UsersIdFollowingResponse; JSON = Get2UsersIdFollowingResponse } "../Models/Get2UsersIdFollowingResponse";
import { type Get2UsersIdLikedTweetsResponse; JSON = Get2UsersIdLikedTweetsResponse } "../Models/Get2UsersIdLikedTweetsResponse";
import { type Get2UsersIdListMembershipsResponse; JSON = Get2UsersIdListMembershipsResponse } "../Models/Get2UsersIdListMembershipsResponse";
import { type Get2UsersIdMentionsResponse; JSON = Get2UsersIdMentionsResponse } "../Models/Get2UsersIdMentionsResponse";
import { type Get2UsersIdMutingResponse; JSON = Get2UsersIdMutingResponse } "../Models/Get2UsersIdMutingResponse";
import { type Get2UsersIdOwnedListsResponse; JSON = Get2UsersIdOwnedListsResponse } "../Models/Get2UsersIdOwnedListsResponse";
import { type Get2UsersIdPinnedListsResponse; JSON = Get2UsersIdPinnedListsResponse } "../Models/Get2UsersIdPinnedListsResponse";
import { type Get2UsersIdPublicKeysResponse; JSON = Get2UsersIdPublicKeysResponse } "../Models/Get2UsersIdPublicKeysResponse";
import { type Get2UsersIdResponse; JSON = Get2UsersIdResponse } "../Models/Get2UsersIdResponse";
import { type Get2UsersIdTimelinesReverseChronologicalResponse; JSON = Get2UsersIdTimelinesReverseChronologicalResponse } "../Models/Get2UsersIdTimelinesReverseChronologicalResponse";
import { type Get2UsersIdTweetsResponse; JSON = Get2UsersIdTweetsResponse } "../Models/Get2UsersIdTweetsResponse";
import { type Get2UsersMeResponse; JSON = Get2UsersMeResponse } "../Models/Get2UsersMeResponse";
import { type Get2UsersPublicKeysResponse; JSON = Get2UsersPublicKeysResponse } "../Models/Get2UsersPublicKeysResponse";
import { type Get2UsersRepostsOfMeResponse; JSON = Get2UsersRepostsOfMeResponse } "../Models/Get2UsersRepostsOfMeResponse";
import { type Get2UsersResponse; JSON = Get2UsersResponse } "../Models/Get2UsersResponse";
import { type Get2UsersSearchResponse; JSON = Get2UsersSearchResponse } "../Models/Get2UsersSearchResponse";
import { type GetChatConversationsUserFieldsParameterInner; JSON = GetChatConversationsUserFieldsParameterInner } "../Models/GetChatConversationsUserFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner";
import { type GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner; JSON = GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner } "../Models/GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner";
import { type GetListsByIdExpansionsParameterInner; JSON = GetListsByIdExpansionsParameterInner } "../Models/GetListsByIdExpansionsParameterInner";
import { type GetListsByIdListFieldsParameterInner; JSON = GetListsByIdListFieldsParameterInner } "../Models/GetListsByIdListFieldsParameterInner";
import { type GetListsFollowersExpansionsParameterInner; JSON = GetListsFollowersExpansionsParameterInner } "../Models/GetListsFollowersExpansionsParameterInner";
import { type GetListsPostsExpansionsParameterInner; JSON = GetListsPostsExpansionsParameterInner } "../Models/GetListsPostsExpansionsParameterInner";
import { type GetListsPostsPlaceFieldsParameterInner; JSON = GetListsPostsPlaceFieldsParameterInner } "../Models/GetListsPostsPlaceFieldsParameterInner";
import { type GetListsPostsPollFieldsParameterInner; JSON = GetListsPostsPollFieldsParameterInner } "../Models/GetListsPostsPollFieldsParameterInner";
import { type GetPostsQuotedPostsExcludeParameterInner; JSON = GetPostsQuotedPostsExcludeParameterInner } "../Models/GetPostsQuotedPostsExcludeParameterInner";
import { type GetUsersPublicKeysPublicKeyFieldsParameterInner; JSON = GetUsersPublicKeysPublicKeyFieldsParameterInner } "../Models/GetUsersPublicKeysPublicKeyFieldsParameterInner";
import { type ListFollowedRequest; JSON = ListFollowedRequest } "../Models/ListFollowedRequest";
import { type ListFollowedResponse; JSON = ListFollowedResponse } "../Models/ListFollowedResponse";
import { type ListPinnedRequest; JSON = ListPinnedRequest } "../Models/ListPinnedRequest";
import { type ListPinnedResponse; JSON = ListPinnedResponse } "../Models/ListPinnedResponse";
import { type ListUnpinResponse; JSON = ListUnpinResponse } "../Models/ListUnpinResponse";
import { type MuteUserMutationResponse; JSON = MuteUserMutationResponse } "../Models/MuteUserMutationResponse";
import { type MuteUserRequest; JSON = MuteUserRequest } "../Models/MuteUserRequest";
import { type Problem; JSON = Problem } "../Models/Problem";
import { type UsersDMBlockCreateResponse; JSON = UsersDMBlockCreateResponse } "../Models/UsersDMBlockCreateResponse";
import { type UsersDMUnBlockCreateResponse; JSON = UsersDMUnBlockCreateResponse } "../Models/UsersDMUnBlockCreateResponse";
import { type UsersFollowingCreateRequest; JSON = UsersFollowingCreateRequest } "../Models/UsersFollowingCreateRequest";
import { type UsersFollowingCreateResponse; JSON = UsersFollowingCreateResponse } "../Models/UsersFollowingCreateResponse";
import { type UsersFollowingDeleteResponse; JSON = UsersFollowingDeleteResponse } "../Models/UsersFollowingDeleteResponse";
import { type UsersLikesCreateRequest; JSON = UsersLikesCreateRequest } "../Models/UsersLikesCreateRequest";
import { type UsersLikesCreateResponse; JSON = UsersLikesCreateResponse } "../Models/UsersLikesCreateResponse";
import { type UsersLikesDeleteResponse; JSON = UsersLikesDeleteResponse } "../Models/UsersLikesDeleteResponse";
import { type UsersRetweetsCreateRequest; JSON = UsersRetweetsCreateRequest } "../Models/UsersRetweetsCreateRequest";
import { type UsersRetweetsCreateResponse; JSON = UsersRetweetsCreateResponse } "../Models/UsersRetweetsCreateResponse";
import { type UsersRetweetsDeleteResponse; JSON = UsersRetweetsDeleteResponse } "../Models/UsersRetweetsDeleteResponse";
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


    /// Block DMs
    /// Blocks direct messages to or from a specific User by their ID for the authenticated user.
    public func blockUsersDms(config : Config, id : Text) : async* UsersDMBlockCreateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/dm/block"
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
            from_candid(_) : ?UsersDMBlockCreateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UsersDMBlockCreateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UsersDMBlockCreateResponse");
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

    /// Create Bookmark
    /// Adds a post to the authenticated user’s bookmarks.
    public func createUsersBookmark(config : Config, id : Text, bookmarkAddRequest : BookmarkAddRequest) : async* BookmarkMutationResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/bookmarks"
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
                let jsonValue = BookmarkAddRequest.toJSON(bookmarkAddRequest);
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
            from_candid(_) : ?BookmarkMutationResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (BookmarkMutationResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to BookmarkMutationResponse");
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

    /// Delete Bookmark
    /// Removes a Post from the authenticated user’s Bookmarks by its ID.
    public func deleteUsersBookmark(config : Config, id : Text, tweetId : Text) : async* BookmarkMutationResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/bookmarks/{tweet_id}"
            |> Text.replace(_, #text "{id}", id)
            |> Text.replace(_, #text "{tweet_id}", tweetId);

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
            from_candid(_) : ?BookmarkMutationResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (BookmarkMutationResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to BookmarkMutationResponse");
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

    /// Follow User
    /// Causes the authenticated user to follow a specific user by their ID.
    public func followUser(config : Config, id : Text, usersFollowingCreateRequest : UsersFollowingCreateRequest) : async* UsersFollowingCreateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/following"
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
                let jsonValue = UsersFollowingCreateRequest.toJSON(usersFollowingCreateRequest);
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
            from_candid(_) : ?UsersFollowingCreateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UsersFollowingCreateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UsersFollowingCreateResponse");
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

    /// Get Liking Users
    /// Retrieves a list of Users who liked a specific Post by its ID.
    public func getPostsLikingUsers(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2TweetsIdLikingUsersResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/{id}/liking_users"
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
            from_candid(_) : ?Get2TweetsIdLikingUsersResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2TweetsIdLikingUsersResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2TweetsIdLikingUsersResponse");
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

    /// Get Reposted by
    /// Retrieves a list of Users who reposted a specific Post by its ID.
    public func getPostsRepostedBy(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2TweetsIdRetweetedByResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/tweets/{id}/retweeted_by"
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
            from_candid(_) : ?Get2TweetsIdRetweetedByResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2TweetsIdRetweetedByResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2TweetsIdRetweetedByResponse");
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

    /// Get affiliates
    /// Retrieves a list of Users who are affiliated with a specific organization User by their ID.
    public func getUsersAffiliates(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersIdAffiliatesResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/affiliates"
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
            from_candid(_) : ?Get2UsersIdAffiliatesResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdAffiliatesResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdAffiliatesResponse");
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

    /// Get blocking
    /// Retrieves a list of Users blocked by the specified User ID.
    public func getUsersBlocking(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersIdBlockingResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/blocking"
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
            from_candid(_) : ?Get2UsersIdBlockingResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdBlockingResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdBlockingResponse");
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

    /// Get Bookmark folders
    /// Retrieves a list of Bookmark folders created by the authenticated user.
    public func getUsersBookmarkFolders(config : Config, id : Text, maxResults : Nat, paginationToken : Text) : async* BookmarkFoldersResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/bookmarks/folders"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken;

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
            from_candid(_) : ?BookmarkFoldersResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (BookmarkFoldersResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to BookmarkFoldersResponse");
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

    /// Get Bookmarks
    /// Retrieves a list of Posts bookmarked by the authenticated user.
    public func getUsersBookmarks(config : Config, id : Text, maxResults : Nat, paginationToken : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2UsersIdBookmarksResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/bookmarks"
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
            from_candid(_) : ?Get2UsersIdBookmarksResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdBookmarksResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdBookmarksResponse");
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

    /// Get Bookmarks by folder ID
    /// Retrieves Posts in a specific Bookmark folder by its ID for the authenticated user.
    public func getUsersBookmarksByFolderId(config : Config, id : Text, folderId : Text) : async* BookmarkFolderPostsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/bookmarks/folders/{folder_id}"
            |> Text.replace(_, #text "{id}", id)
            |> Text.replace(_, #text "{folder_id}", folderId);

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
            from_candid(_) : ?BookmarkFolderPostsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (BookmarkFolderPostsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to BookmarkFolderPostsResponse");
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

    /// Get User by ID
    /// Retrieves details of a specific User by their ID.
    public func getUsersById(config : Config, id : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersIdResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2UsersIdResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdResponse");
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

    /// Get Users by IDs
    /// Retrieves details of multiple Users by their IDs.
    public func getUsersByIds(config : Config, ids : [Text], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users"
            # "?" # "ids=" # debug_show(ids) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2UsersResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersResponse");
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

    /// Get User by username
    /// Retrieves details of a specific User by their username.
    public func getUsersByUsername(config : Config, username : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersByUsernameUsernameResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/by/username/{username}"
            |> Text.replace(_, #text "{username}", username)
            # "?" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2UsersByUsernameUsernameResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersByUsernameUsernameResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersByUsernameUsernameResponse");
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

    /// Get Users by usernames
    /// Retrieves details of multiple Users by their usernames.
    public func getUsersByUsernames(config : Config, usernames : [Text], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersByResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/by"
            # "?" # "usernames=" # debug_show(usernames) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2UsersByResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersByResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersByResponse");
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

    /// Get followers
    /// Retrieves a list of Users who follow a specific User by their ID.
    public func getUsersFollowers(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersIdFollowersResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/followers"
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
            from_candid(_) : ?Get2UsersIdFollowersResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdFollowersResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdFollowersResponse");
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

    /// Get following
    /// Retrieves a list of Users followed by a specific User by their ID.
    public func getUsersFollowing(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersIdFollowingResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/following"
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
            from_candid(_) : ?Get2UsersIdFollowingResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdFollowingResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdFollowingResponse");
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

    /// Get liked Posts
    /// Retrieves a list of Posts liked by a specific User by their ID.
    public func getUsersLikedPosts(config : Config, id : Text, maxResults : Nat, paginationToken : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2UsersIdLikedTweetsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/liked_tweets"
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
            from_candid(_) : ?Get2UsersIdLikedTweetsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdLikedTweetsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdLikedTweetsResponse");
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

    /// Get my User
    /// Retrieves details of the authenticated user.
    public func getUsersMe(config : Config, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersMeResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/me"
            # "?" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2UsersMeResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersMeResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersMeResponse");
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

    /// Get mentions
    /// Retrieves a list of Posts that mention a specific User by their ID.
    public func getUsersMentions(config : Config, id : Text, sinceId : Text, untilId : Text, maxResults : Nat, paginationToken : Text, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2UsersIdMentionsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/mentions"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "since_id=" # sinceId # "&" # "until_id=" # untilId # "&" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?Get2UsersIdMentionsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdMentionsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdMentionsResponse");
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

    /// Get muting
    /// Retrieves a list of Users muted by the authenticated user.
    public func getUsersMuting(config : Config, id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersIdMutingResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/muting"
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
            from_candid(_) : ?Get2UsersIdMutingResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdMutingResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdMutingResponse");
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

    /// Get Posts
    /// Retrieves a list of posts authored by a specific User by their ID.
    public func getUsersPosts(config : Config, id : Text, sinceId : Text, untilId : Text, maxResults : Nat, paginationToken : Text, exclude : [GetPostsQuotedPostsExcludeParameterInner], startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2UsersIdTweetsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/tweets"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "since_id=" # sinceId # "&" # "until_id=" # untilId # "&" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "exclude=" # debug_show(exclude) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?Get2UsersIdTweetsResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdTweetsResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdTweetsResponse");
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

    /// Get Reposts of me
    /// Retrieves a list of Posts that repost content from the authenticated user.
    public func getUsersRepostsOfMe(config : Config, maxResults : Nat, paginationToken : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2UsersRepostsOfMeResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/reposts_of_me"
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
            from_candid(_) : ?Get2UsersRepostsOfMeResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersRepostsOfMeResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersRepostsOfMeResponse");
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

    /// Get Timeline
    /// Retrieves a reverse chronological list of Posts in the authenticated User’s Timeline.
    public func getUsersTimeline(config : Config, id : Text, sinceId : Text, untilId : Text, maxResults : Nat, paginationToken : Text, exclude : [GetPostsQuotedPostsExcludeParameterInner], startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async* Get2UsersIdTimelinesReverseChronologicalResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/timelines/reverse_chronological"
            |> Text.replace(_, #text "{id}", id)
            # "?" # "since_id=" # sinceId # "&" # "until_id=" # untilId # "&" # "max_results=" # Int.toText(maxResults) # "&" # "pagination_token=" # paginationToken # "&" # "exclude=" # debug_show(exclude) # "&" # "start_time=" # debug_show(startTime) # "&" # "end_time=" # debug_show(endTime) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "media.fields=" # debug_show(mediaPeriodfields) # "&" # "poll.fields=" # debug_show(pollPeriodfields) # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "place.fields=" # debug_show(placePeriodfields);

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
            from_candid(_) : ?Get2UsersIdTimelinesReverseChronologicalResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersIdTimelinesReverseChronologicalResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersIdTimelinesReverseChronologicalResponse");
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

    /// Like Post
    /// Causes the authenticated user to Like a specific Post by its ID.
    public func likePost(config : Config, id : Text, usersLikesCreateRequest : UsersLikesCreateRequest) : async* UsersLikesCreateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/likes"
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
                let jsonValue = UsersLikesCreateRequest.toJSON(usersLikesCreateRequest);
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
            from_candid(_) : ?UsersLikesCreateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UsersLikesCreateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UsersLikesCreateResponse");
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

    /// Mute User
    /// Causes the authenticated user to mute a specific User by their ID.
    public func muteUser(config : Config, id : Text, muteUserRequest : MuteUserRequest) : async* MuteUserMutationResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/muting"
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
                let jsonValue = MuteUserRequest.toJSON(muteUserRequest);
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
            from_candid(_) : ?MuteUserMutationResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MuteUserMutationResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MuteUserMutationResponse");
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

    /// Repost Post
    /// Causes the authenticated user to repost a specific Post by its ID.
    public func repostPost(config : Config, id : Text, usersRetweetsCreateRequest : UsersRetweetsCreateRequest) : async* UsersRetweetsCreateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/retweets"
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
                let jsonValue = UsersRetweetsCreateRequest.toJSON(usersRetweetsCreateRequest);
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
            from_candid(_) : ?UsersRetweetsCreateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UsersRetweetsCreateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UsersRetweetsCreateResponse");
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

    /// Search Users
    /// Retrieves a list of Users matching a search query.
    public func searchUsers(config : Config, query_ : Text, maxResults : Nat, nextToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async* Get2UsersSearchResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/search"
            # "?" # "query=" # query_ # "&" # "max_results=" # Int.toText(maxResults) # "&" # "next_token=" # nextToken # "&" # "user.fields=" # debug_show(userPeriodfields) # "&" # "expansions=" # debug_show(expansions) # "&" # "tweet.fields=" # debug_show(tweetPeriodfields);

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
            from_candid(_) : ?Get2UsersSearchResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (Get2UsersSearchResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to Get2UsersSearchResponse");
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

    /// Unblock DMs
    /// Unblocks direct messages to or from a specific User by their ID for the authenticated user.
    public func unblockUsersDms(config : Config, id : Text) : async* UsersDMUnBlockCreateResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/dm/unblock"
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
            from_candid(_) : ?UsersDMUnBlockCreateResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UsersDMUnBlockCreateResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UsersDMUnBlockCreateResponse");
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

    /// Unfollow User
    /// Causes the authenticated user to unfollow a specific user by their ID.
    public func unfollowUser(config : Config, sourceUserId : Text, targetUserId : Text) : async* UsersFollowingDeleteResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{source_user_id}/following/{target_user_id}"
            |> Text.replace(_, #text "{source_user_id}", sourceUserId)
            |> Text.replace(_, #text "{target_user_id}", targetUserId);

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
            from_candid(_) : ?UsersFollowingDeleteResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UsersFollowingDeleteResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UsersFollowingDeleteResponse");
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

    /// Unlike Post
    /// Causes the authenticated user to Unlike a specific Post by its ID.
    public func unlikePost(config : Config, id : Text, tweetId : Text) : async* UsersLikesDeleteResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/likes/{tweet_id}"
            |> Text.replace(_, #text "{id}", id)
            |> Text.replace(_, #text "{tweet_id}", tweetId);

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
            from_candid(_) : ?UsersLikesDeleteResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UsersLikesDeleteResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UsersLikesDeleteResponse");
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

    /// Unmute User
    /// Causes the authenticated user to unmute a specific user by their ID.
    public func unmuteUser(config : Config, sourceUserId : Text, targetUserId : Text) : async* MuteUserMutationResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{source_user_id}/muting/{target_user_id}"
            |> Text.replace(_, #text "{source_user_id}", sourceUserId)
            |> Text.replace(_, #text "{target_user_id}", targetUserId);

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
            from_candid(_) : ?MuteUserMutationResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MuteUserMutationResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MuteUserMutationResponse");
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

    /// Unrepost Post
    /// Causes the authenticated user to unrepost a specific Post by its ID.
    public func unrepostPost(config : Config, id : Text, sourceTweetId : Text) : async* UsersRetweetsDeleteResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2/users/{id}/retweets/{source_tweet_id}"
            |> Text.replace(_, #text "{id}", id)
            |> Text.replace(_, #text "{source_tweet_id}", sourceTweetId);

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
            from_candid(_) : ?UsersRetweetsDeleteResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (UsersRetweetsDeleteResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to UsersRetweetsDeleteResponse");
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
        blockUsersDms;
        createUsersBookmark;
        deleteUsersBookmark;
        followList;
        followUser;
        getListsFollowers;
        getListsMembers;
        getPostsLikingUsers;
        getPostsRepostedBy;
        getUsersAffiliates;
        getUsersBlocking;
        getUsersBookmarkFolders;
        getUsersBookmarks;
        getUsersBookmarksByFolderId;
        getUsersById;
        getUsersByIds;
        getUsersByUsername;
        getUsersByUsernames;
        getUsersFollowedLists;
        getUsersFollowers;
        getUsersFollowing;
        getUsersLikedPosts;
        getUsersListMemberships;
        getUsersMe;
        getUsersMentions;
        getUsersMuting;
        getUsersOwnedLists;
        getUsersPinnedLists;
        getUsersPosts;
        getUsersPublicKey;
        getUsersPublicKeys;
        getUsersRepostsOfMe;
        getUsersTimeline;
        likePost;
        muteUser;
        pinList;
        repostPost;
        searchUsers;
        unblockUsersDms;
        unfollowList;
        unfollowUser;
        unlikePost;
        unmuteUser;
        unpinList;
        unrepostPost;
    };

    public module class UsersApi(config : Config) {
        /// Block DMs
        /// Blocks direct messages to or from a specific User by their ID for the authenticated user.
        public func blockUsersDms(id : Text) : async UsersDMBlockCreateResponse {
            await* operations__.blockUsersDms(config, id)
        };

        /// Create Bookmark
        /// Adds a post to the authenticated user’s bookmarks.
        public func createUsersBookmark(id : Text, bookmarkAddRequest : BookmarkAddRequest) : async BookmarkMutationResponse {
            await* operations__.createUsersBookmark(config, id, bookmarkAddRequest)
        };

        /// Delete Bookmark
        /// Removes a Post from the authenticated user’s Bookmarks by its ID.
        public func deleteUsersBookmark(id : Text, tweetId : Text) : async BookmarkMutationResponse {
            await* operations__.deleteUsersBookmark(config, id, tweetId)
        };

        /// Follow List
        /// Causes the authenticated user to follow a specific List by its ID.
        public func followList(id : Text, listFollowedRequest : ListFollowedRequest) : async ListFollowedResponse {
            await* operations__.followList(config, id, listFollowedRequest)
        };

        /// Follow User
        /// Causes the authenticated user to follow a specific user by their ID.
        public func followUser(id : Text, usersFollowingCreateRequest : UsersFollowingCreateRequest) : async UsersFollowingCreateResponse {
            await* operations__.followUser(config, id, usersFollowingCreateRequest)
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

        /// Get Liking Users
        /// Retrieves a list of Users who liked a specific Post by its ID.
        public func getPostsLikingUsers(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2TweetsIdLikingUsersResponse {
            await* operations__.getPostsLikingUsers(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get Reposted by
        /// Retrieves a list of Users who reposted a specific Post by its ID.
        public func getPostsRepostedBy(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2TweetsIdRetweetedByResponse {
            await* operations__.getPostsRepostedBy(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get affiliates
        /// Retrieves a list of Users who are affiliated with a specific organization User by their ID.
        public func getUsersAffiliates(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersIdAffiliatesResponse {
            await* operations__.getUsersAffiliates(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get blocking
        /// Retrieves a list of Users blocked by the specified User ID.
        public func getUsersBlocking(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersIdBlockingResponse {
            await* operations__.getUsersBlocking(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get Bookmark folders
        /// Retrieves a list of Bookmark folders created by the authenticated user.
        public func getUsersBookmarkFolders(id : Text, maxResults : Nat, paginationToken : Text) : async BookmarkFoldersResponse {
            await* operations__.getUsersBookmarkFolders(config, id, maxResults, paginationToken)
        };

        /// Get Bookmarks
        /// Retrieves a list of Posts bookmarked by the authenticated user.
        public func getUsersBookmarks(id : Text, maxResults : Nat, paginationToken : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2UsersIdBookmarksResponse {
            await* operations__.getUsersBookmarks(config, id, maxResults, paginationToken, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Get Bookmarks by folder ID
        /// Retrieves Posts in a specific Bookmark folder by its ID for the authenticated user.
        public func getUsersBookmarksByFolderId(id : Text, folderId : Text) : async BookmarkFolderPostsResponse {
            await* operations__.getUsersBookmarksByFolderId(config, id, folderId)
        };

        /// Get User by ID
        /// Retrieves details of a specific User by their ID.
        public func getUsersById(id : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersIdResponse {
            await* operations__.getUsersById(config, id, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get Users by IDs
        /// Retrieves details of multiple Users by their IDs.
        public func getUsersByIds(ids : [Text], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersResponse {
            await* operations__.getUsersByIds(config, ids, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get User by username
        /// Retrieves details of a specific User by their username.
        public func getUsersByUsername(username : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersByUsernameUsernameResponse {
            await* operations__.getUsersByUsername(config, username, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get Users by usernames
        /// Retrieves details of multiple Users by their usernames.
        public func getUsersByUsernames(usernames : [Text], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersByResponse {
            await* operations__.getUsersByUsernames(config, usernames, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get followed Lists
        /// Retrieves a list of Lists followed by a specific User by their ID.
        public func getUsersFollowedLists(id : Text, maxResults : Nat, paginationToken : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async Get2UsersIdFollowedListsResponse {
            await* operations__.getUsersFollowedLists(config, id, maxResults, paginationToken, listPeriodfields, expansions, userPeriodfields)
        };

        /// Get followers
        /// Retrieves a list of Users who follow a specific User by their ID.
        public func getUsersFollowers(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersIdFollowersResponse {
            await* operations__.getUsersFollowers(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get following
        /// Retrieves a list of Users followed by a specific User by their ID.
        public func getUsersFollowing(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersIdFollowingResponse {
            await* operations__.getUsersFollowing(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get liked Posts
        /// Retrieves a list of Posts liked by a specific User by their ID.
        public func getUsersLikedPosts(id : Text, maxResults : Nat, paginationToken : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2UsersIdLikedTweetsResponse {
            await* operations__.getUsersLikedPosts(config, id, maxResults, paginationToken, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Get List memberships
        /// Retrieves a list of Lists that a specific User is a member of by their ID.
        public func getUsersListMemberships(id : Text, maxResults : Nat, paginationToken : Text, listPeriodfields : [GetListsByIdListFieldsParameterInner], expansions : [GetListsByIdExpansionsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner]) : async Get2UsersIdListMembershipsResponse {
            await* operations__.getUsersListMemberships(config, id, maxResults, paginationToken, listPeriodfields, expansions, userPeriodfields)
        };

        /// Get my User
        /// Retrieves details of the authenticated user.
        public func getUsersMe(userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersMeResponse {
            await* operations__.getUsersMe(config, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Get mentions
        /// Retrieves a list of Posts that mention a specific User by their ID.
        public func getUsersMentions(id : Text, sinceId : Text, untilId : Text, maxResults : Nat, paginationToken : Text, startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2UsersIdMentionsResponse {
            await* operations__.getUsersMentions(config, id, sinceId, untilId, maxResults, paginationToken, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Get muting
        /// Retrieves a list of Users muted by the authenticated user.
        public func getUsersMuting(id : Text, maxResults : Nat, paginationToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersIdMutingResponse {
            await* operations__.getUsersMuting(config, id, maxResults, paginationToken, userPeriodfields, expansions, tweetPeriodfields)
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

        /// Get Posts
        /// Retrieves a list of posts authored by a specific User by their ID.
        public func getUsersPosts(id : Text, sinceId : Text, untilId : Text, maxResults : Nat, paginationToken : Text, exclude : [GetPostsQuotedPostsExcludeParameterInner], startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2UsersIdTweetsResponse {
            await* operations__.getUsersPosts(config, id, sinceId, untilId, maxResults, paginationToken, exclude, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
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

        /// Get Reposts of me
        /// Retrieves a list of Posts that repost content from the authenticated user.
        public func getUsersRepostsOfMe(maxResults : Nat, paginationToken : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2UsersRepostsOfMeResponse {
            await* operations__.getUsersRepostsOfMe(config, maxResults, paginationToken, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Get Timeline
        /// Retrieves a reverse chronological list of Posts in the authenticated User’s Timeline.
        public func getUsersTimeline(id : Text, sinceId : Text, untilId : Text, maxResults : Nat, paginationToken : Text, exclude : [GetPostsQuotedPostsExcludeParameterInner], startTime : Text, endTime : Text, tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner], expansions : [GetListsPostsExpansionsParameterInner], mediaPeriodfields : [GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner], pollPeriodfields : [GetListsPostsPollFieldsParameterInner], userPeriodfields : [GetChatConversationsUserFieldsParameterInner], placePeriodfields : [GetListsPostsPlaceFieldsParameterInner]) : async Get2UsersIdTimelinesReverseChronologicalResponse {
            await* operations__.getUsersTimeline(config, id, sinceId, untilId, maxResults, paginationToken, exclude, startTime, endTime, tweetPeriodfields, expansions, mediaPeriodfields, pollPeriodfields, userPeriodfields, placePeriodfields)
        };

        /// Like Post
        /// Causes the authenticated user to Like a specific Post by its ID.
        public func likePost(id : Text, usersLikesCreateRequest : UsersLikesCreateRequest) : async UsersLikesCreateResponse {
            await* operations__.likePost(config, id, usersLikesCreateRequest)
        };

        /// Mute User
        /// Causes the authenticated user to mute a specific User by their ID.
        public func muteUser(id : Text, muteUserRequest : MuteUserRequest) : async MuteUserMutationResponse {
            await* operations__.muteUser(config, id, muteUserRequest)
        };

        /// Pin List
        /// Causes the authenticated user to pin a specific List by its ID.
        public func pinList(id : Text, listPinnedRequest : ListPinnedRequest) : async ListPinnedResponse {
            await* operations__.pinList(config, id, listPinnedRequest)
        };

        /// Repost Post
        /// Causes the authenticated user to repost a specific Post by its ID.
        public func repostPost(id : Text, usersRetweetsCreateRequest : UsersRetweetsCreateRequest) : async UsersRetweetsCreateResponse {
            await* operations__.repostPost(config, id, usersRetweetsCreateRequest)
        };

        /// Search Users
        /// Retrieves a list of Users matching a search query.
        public func searchUsers(query_ : Text, maxResults : Nat, nextToken : Text, userPeriodfields : [GetChatConversationsUserFieldsParameterInner], expansions : [GetListsFollowersExpansionsParameterInner], tweetPeriodfields : [GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner]) : async Get2UsersSearchResponse {
            await* operations__.searchUsers(config, query_, maxResults, nextToken, userPeriodfields, expansions, tweetPeriodfields)
        };

        /// Unblock DMs
        /// Unblocks direct messages to or from a specific User by their ID for the authenticated user.
        public func unblockUsersDms(id : Text) : async UsersDMUnBlockCreateResponse {
            await* operations__.unblockUsersDms(config, id)
        };

        /// Unfollow List
        /// Causes the authenticated user to unfollow a specific List by its ID.
        public func unfollowList(id : Text, listId : Text) : async ListFollowedResponse {
            await* operations__.unfollowList(config, id, listId)
        };

        /// Unfollow User
        /// Causes the authenticated user to unfollow a specific user by their ID.
        public func unfollowUser(sourceUserId : Text, targetUserId : Text) : async UsersFollowingDeleteResponse {
            await* operations__.unfollowUser(config, sourceUserId, targetUserId)
        };

        /// Unlike Post
        /// Causes the authenticated user to Unlike a specific Post by its ID.
        public func unlikePost(id : Text, tweetId : Text) : async UsersLikesDeleteResponse {
            await* operations__.unlikePost(config, id, tweetId)
        };

        /// Unmute User
        /// Causes the authenticated user to unmute a specific user by their ID.
        public func unmuteUser(sourceUserId : Text, targetUserId : Text) : async MuteUserMutationResponse {
            await* operations__.unmuteUser(config, sourceUserId, targetUserId)
        };

        /// Unpin List
        /// Causes the authenticated user to unpin a specific List by its ID.
        public func unpinList(id : Text, listId : Text) : async ListUnpinResponse {
            await* operations__.unpinList(config, id, listId)
        };

        /// Unrepost Post
        /// Causes the authenticated user to unrepost a specific Post by its ID.
        public func unrepostPost(id : Text, sourceTweetId : Text) : async UsersRetweetsDeleteResponse {
            await* operations__.unrepostPost(config, id, sourceTweetId)
        };

    }
}
