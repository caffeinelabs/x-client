/// Nonpublic engagement metrics for the Tweet at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetNonPublicMetrics.mo

module {
    public type TweetNonPublicMetrics = {
        /// Number of times this Tweet has been viewed.
        impression_count : ?Int;
    };

    public module JSON {
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
