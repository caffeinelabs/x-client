import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ContentExpiration.mo

module {
    public type ContentExpiration = {
        /// Expiration time for content as a Unix timestamp in seconds
        timestamp_sec : Float;
    };

    public module JSON {
        public func toCandidValue(value : ContentExpiration) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("timestamp_sec", #Float(value.timestamp_sec)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ContentExpiration =
            switch (candid) {
                case (#Record(fields)) {
                    let ?timestamp_sec_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "timestamp_sec") else return null;
                    let ?timestamp_sec = ((switch (timestamp_sec_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    ?{
                        timestamp_sec;
                    };
                };
                case _ null;
            };
    };
};
