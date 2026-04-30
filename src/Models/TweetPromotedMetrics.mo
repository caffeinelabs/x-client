/// Promoted nonpublic engagement metrics for the Tweet at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetPromotedMetrics.mo

module {
    /// The required-fields slice of TweetPromotedMetrics — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetPromotedMetrics as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        impression_count : ?Int;
        like_count : ?Int;
        reply_count : ?Int;
        retweet_count : ?Int;
    };

    public type TweetPromotedMetrics = Required and Optional;

    public module JSON {
        // `init` constructs a TweetPromotedMetrics from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetPromotedMetrics.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetPromotedMetrics {
            let ?res = from_candid(to_candid(required)) : ?TweetPromotedMetrics else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetPromotedMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.impression_count) {
                case (?v__) List.add(buf, ("impression_count", #Int(v__)));
                case null ();
            };
            switch (value.like_count) {
                case (?v__) List.add(buf, ("like_count", #Int(v__)));
                case null ();
            };
            switch (value.reply_count) {
                case (?v__) List.add(buf, ("reply_count", #Int(v__)));
                case null ();
            };
            switch (value.retweet_count) {
                case (?v__) List.add(buf, ("retweet_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetPromotedMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let impression_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "impression_count")) {
                        case (?impression_count_field) ((switch (impression_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let like_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "like_count")) {
                        case (?like_count_field) ((switch (like_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let reply_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reply_count")) {
                        case (?reply_count_field) ((switch (reply_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let retweet_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "retweet_count")) {
                        case (?retweet_count_field) ((switch (retweet_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        impression_count;
                        like_count;
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
