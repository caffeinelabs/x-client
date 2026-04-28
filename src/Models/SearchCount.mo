/// Represent a Search Count Result.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

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
