/// A list of metrics for this User.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserPublicMetrics.mo

module {
    /// The required-fields slice of UserPublicMetrics — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Number of Users who are following this User.
        followers_count : Int;
        /// Number of Users this User is following.
        following_count : Int;
        /// The number of lists that include this User.
        listed_count : Int;
        /// The number of Posts (including Retweets) posted by this User.
        tweet_count : Int;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UserPublicMetrics as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        like_count : ?Int;
    };

    public type UserPublicMetrics = Required and Optional;

    public module JSON {
        // `init` constructs a UserPublicMetrics from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserPublicMetrics.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UserPublicMetrics {
            let ?res = from_candid(to_candid(required)) : ?UserPublicMetrics else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserPublicMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("followers_count", #Int(value.followers_count)));
            List.add(buf, ("following_count", #Int(value.following_count)));
            switch (value.like_count) {
                case (?v__) List.add(buf, ("like_count", #Int(v__)));
                case null ();
            };
            List.add(buf, ("listed_count", #Int(value.listed_count)));
            List.add(buf, ("tweet_count", #Int(value.tweet_count)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserPublicMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let ?followers_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "followers_count") else return null;
                    let ?followers_count = ((switch (followers_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?following_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "following_count") else return null;
                    let ?following_count = ((switch (following_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let like_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "like_count")) {
                        case (?like_count_field) ((switch (like_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?listed_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "listed_count") else return null;
                    let ?listed_count = ((switch (listed_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?tweet_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_count") else return null;
                    let ?tweet_count = ((switch (tweet_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        followers_count;
                        following_count;
                        like_count;
                        listed_count;
                        tweet_count;
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
