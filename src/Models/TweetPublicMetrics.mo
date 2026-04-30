/// Engagement metrics for the Tweet at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetPublicMetrics.mo

module {
    /// The required-fields slice of TweetPublicMetrics — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Number of times this Tweet has been bookmarked.
        bookmark_count : Int;
        /// Number of times this Tweet has been viewed.
        impression_count : Int;
        /// Number of times this Tweet has been liked.
        like_count : Int;
        /// Number of times this Tweet has been replied to.
        reply_count : Int;
        /// Number of times this Tweet has been Retweeted.
        retweet_count : Int;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetPublicMetrics as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        quote_count : ?Int;
    };

    public type TweetPublicMetrics = Required and Optional;

    public module JSON {
        // `init` constructs a TweetPublicMetrics from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetPublicMetrics.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetPublicMetrics {
            let ?res = from_candid(to_candid(required)) : ?TweetPublicMetrics else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetPublicMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("bookmark_count", #Int(value.bookmark_count)));
            List.add(buf, ("impression_count", #Int(value.impression_count)));
            List.add(buf, ("like_count", #Int(value.like_count)));
            switch (value.quote_count) {
                case (?v__) List.add(buf, ("quote_count", #Int(v__)));
                case null ();
            };
            List.add(buf, ("reply_count", #Int(value.reply_count)));
            List.add(buf, ("retweet_count", #Int(value.retweet_count)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetPublicMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let ?bookmark_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bookmark_count") else return null;
                    let ?bookmark_count = ((switch (bookmark_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?impression_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "impression_count") else return null;
                    let ?impression_count = ((switch (impression_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?like_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "like_count") else return null;
                    let ?like_count = ((switch (like_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let quote_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "quote_count")) {
                        case (?quote_count_field) ((switch (quote_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?reply_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reply_count") else return null;
                    let ?reply_count = ((switch (reply_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?retweet_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "retweet_count") else return null;
                    let ?retweet_count = ((switch (retweet_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        bookmark_count;
                        impression_count;
                        like_count;
                        quote_count;
                        reply_count;
                        retweet_count;
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
