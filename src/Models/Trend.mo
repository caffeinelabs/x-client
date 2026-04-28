/// A trend.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Trend.mo

module {
    public type Trend = {
        /// Name of the trend.
        trend_name : ?Text;
        /// Number of Posts in this trend.
        tweet_count : ?Int;
    };

    public module JSON {
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
};
