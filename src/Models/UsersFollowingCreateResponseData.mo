import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UsersFollowingCreateResponseData.mo

module {
    /// The required-fields slice of UsersFollowingCreateResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UsersFollowingCreateResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        following : ?Bool;
        pending_follow : ?Bool;
    };

    public type UsersFollowingCreateResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a UsersFollowingCreateResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UsersFollowingCreateResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UsersFollowingCreateResponseData {
            let ?res = from_candid(to_candid(required)) : ?UsersFollowingCreateResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UsersFollowingCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.following) {
                case (?v__) List.add(buf, ("following", #Bool(v__)));
                case null ();
            };
            switch (value.pending_follow) {
                case (?v__) List.add(buf, ("pending_follow", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersFollowingCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let following : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "following")) {
                        case (?following_field) ((switch (following_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let pending_follow : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "pending_follow")) {
                        case (?pending_follow_field) ((switch (pending_follow_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        following;
                        pending_follow;
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
