
import { type BookmarkFolderPostsResponseDataInner; JSON = BookmarkFolderPostsResponseDataInner } "./BookmarkFolderPostsResponseDataInner";

import { type BookmarkFolderPostsResponseMeta; JSON = BookmarkFolderPostsResponseMeta } "./BookmarkFolderPostsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// BookmarkFolderPostsResponse.mo

module {
    /// The required-fields slice of BookmarkFolderPostsResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express BookmarkFolderPostsResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        data : ?[BookmarkFolderPostsResponseDataInner];
        errors : ?[Problem];
        meta : ?BookmarkFolderPostsResponseMeta;
    };

    public type BookmarkFolderPostsResponse = Required and Optional;

    public module JSON {
        // `init` constructs a BookmarkFolderPostsResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { BookmarkFolderPostsResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : BookmarkFolderPostsResponse {
            let ?res = from_candid(to_candid(required)) : ?BookmarkFolderPostsResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : BookmarkFolderPostsResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<BookmarkFolderPostsResponseDataInner, Candid.Candid>(v__, BookmarkFolderPostsResponseDataInner.toCandidValue))));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            switch (value.meta) {
                case (?v__) List.add(buf, ("meta", BookmarkFolderPostsResponseMeta.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?BookmarkFolderPostsResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?[BookmarkFolderPostsResponseDataInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<BookmarkFolderPostsResponseDataInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = BookmarkFolderPostsResponseDataInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let errors : ?[Problem] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors")) {
                        case (?errors_field) ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let meta : ?BookmarkFolderPostsResponseMeta = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "meta")) {
                        case (?meta_field) (BookmarkFolderPostsResponseMeta.fromCandidValue(meta_field.1));
                        case null null;
                    };
                    ?{
                        data;
                        errors;
                        meta;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
