/// Tweet Label event.

import { type TweetLabelData; JSON = TweetLabelData } "./TweetLabelData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetLabelStreamResponseOneOf.mo

module {
    public type TweetLabelStreamResponseOneOf = {
        data : TweetLabelData;
    };

    public module JSON {
        // `init` constructs a TweetLabelStreamResponseOneOf from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetLabelStreamResponseOneOf.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            data : TweetLabelData;
        }) : TweetLabelStreamResponseOneOf {
            let ?res = from_candid(to_candid(required)) : ?TweetLabelStreamResponseOneOf else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetLabelStreamResponseOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("data", TweetLabelData.toCandidValue(value.data)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetLabelStreamResponseOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = (TweetLabelData.fromCandidValue(data_field.1)) else return null;
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
