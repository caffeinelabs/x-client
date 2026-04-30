import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// BookmarkMutationResponseData.mo

module {
    /// The required-fields slice of BookmarkMutationResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express BookmarkMutationResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        bookmarked : ?Bool;
    };

    public type BookmarkMutationResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a BookmarkMutationResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { BookmarkMutationResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : BookmarkMutationResponseData {
            let ?res = from_candid(to_candid(required)) : ?BookmarkMutationResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : BookmarkMutationResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.bookmarked) {
                case (?v__) List.add(buf, ("bookmarked", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?BookmarkMutationResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let bookmarked : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bookmarked")) {
                        case (?bookmarked_field) ((switch (bookmarked_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        bookmarked;
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
