
import { type ActivitySubscriptionUpdateResponseData; JSON = ActivitySubscriptionUpdateResponseData } "./ActivitySubscriptionUpdateResponseData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivitySubscriptionUpdateResponse.mo

module {
    public type ActivitySubscriptionUpdateResponse = {
        data : ?ActivitySubscriptionUpdateResponseData;
    };

    public module JSON {
        // `init` constructs a ActivitySubscriptionUpdateResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ActivitySubscriptionUpdateResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ActivitySubscriptionUpdateResponse {
            let ?res = from_candid(to_candid(required)) : ?ActivitySubscriptionUpdateResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ActivitySubscriptionUpdateResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", ActivitySubscriptionUpdateResponseData.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionUpdateResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?ActivitySubscriptionUpdateResponseData = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (ActivitySubscriptionUpdateResponseData.fromCandidValue(data_field.1));
                        case null null;
                    };
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
