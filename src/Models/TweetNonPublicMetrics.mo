/// Nonpublic engagement metrics for the Tweet at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetNonPublicMetrics.mo

module {
    public type TweetNonPublicMetrics = {
        /// Number of times this Tweet has been viewed.
        impression_count : ?Int;
    };

    public module JSON {
        // `init` constructs a TweetNonPublicMetrics from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetNonPublicMetrics.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : TweetNonPublicMetrics {
            let ?res = from_candid(to_candid(required)) : ?TweetNonPublicMetrics else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetNonPublicMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.impression_count) {
                case (?v__) List.add(buf, ("impression_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetNonPublicMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let impression_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "impression_count")) {
                        case (?impression_count_field) ((switch (impression_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        impression_count;
                    };
                };
                case _ null;
            };
    };
};
