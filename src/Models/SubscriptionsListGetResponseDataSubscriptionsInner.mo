import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SubscriptionsListGetResponseDataSubscriptionsInner.mo

module {
    public type SubscriptionsListGetResponseDataSubscriptionsInner = {
        /// The ID of the user the webhook is subscribed to
        user_id : ?Text;
    };

    public module JSON {
        // `init` constructs a SubscriptionsListGetResponseDataSubscriptionsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SubscriptionsListGetResponseDataSubscriptionsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : SubscriptionsListGetResponseDataSubscriptionsInner {
            let ?res = from_candid(to_candid(required)) : ?SubscriptionsListGetResponseDataSubscriptionsInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : SubscriptionsListGetResponseDataSubscriptionsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.user_id) {
                case (?v__) List.add(buf, ("user_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubscriptionsListGetResponseDataSubscriptionsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let user_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_id")) {
                        case (?user_id_field) ((switch (user_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        user_id;
                    };
                };
                case _ null;
            };
    };
};
