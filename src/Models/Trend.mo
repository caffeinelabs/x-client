/// A trend.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Trend.mo

module {
    /// The required-fields slice of Trend — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Trend as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        trend_name : ?Text;
        tweet_count : ?Int;
    };

    public type Trend = Required and Optional;

    public module JSON {
        // `init` constructs a Trend from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Trend.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Trend {
            let ?res = from_candid(to_candid(required)) : ?Trend else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Trend) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.trend_name) {
                case (?v__) List.add(buf, ("trend_name", #Text(v__)));
                case null ();
            };
            switch (value.tweet_count) {
                case (?v__) List.add(buf, ("tweet_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Trend =
            switch (candid) {
                case (#Record(fields)) {
                    let trend_name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "trend_name")) {
                        case (?trend_name_field) ((switch (trend_name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let tweet_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_count")) {
                        case (?tweet_count_field) ((switch (tweet_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        trend_name;
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
