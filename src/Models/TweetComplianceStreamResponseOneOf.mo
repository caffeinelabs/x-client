/// Compliance event.

import { type TweetComplianceData; JSON = TweetComplianceData } "./TweetComplianceData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetComplianceStreamResponseOneOf.mo

module {
    public type TweetComplianceStreamResponseOneOf = {
        data : TweetComplianceData;
    };

    public module JSON {
        // `init` constructs a TweetComplianceStreamResponseOneOf from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetComplianceStreamResponseOneOf.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            data : TweetComplianceData;
        }) : TweetComplianceStreamResponseOneOf {
            let ?res = from_candid(to_candid(required)) : ?TweetComplianceStreamResponseOneOf else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetComplianceStreamResponseOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("data", TweetComplianceData.toCandidValue(value.data)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetComplianceStreamResponseOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = (TweetComplianceData.fromCandidValue(data_field.1)) else return null;
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
