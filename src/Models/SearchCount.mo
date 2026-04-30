/// Represent a Search Count Result.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SearchCount.mo

module {
    public type SearchCount = {
        /// The end time of the bucket.
        end : Text;
        /// The start time of the bucket.
        start : Text;
        /// The count for the bucket.
        tweet_count : Int;
    };

    public module JSON {
        // `init` constructs a SearchCount from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SearchCount.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            end : Text;
            start : Text;
            tweet_count : Int;
        }) : SearchCount {
            let ?res = from_candid(to_candid(required)) : ?SearchCount else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : SearchCount) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("end", #Text(value.end)));
            List.add(buf, ("start", #Text(value.start)));
            List.add(buf, ("tweet_count", #Int(value.tweet_count)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SearchCount =
            switch (candid) {
                case (#Record(fields)) {
                    let ?end_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end") else return null;
                    let ?end = ((switch (end_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?start_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start") else return null;
                    let ?start = ((switch (start_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?tweet_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_count") else return null;
                    let ?tweet_count = ((switch (tweet_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        end;
                        start;
                        tweet_count;
                    };
                };
                case _ null;
            };
    };
};
