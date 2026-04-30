import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivitySubscriptionDeleteResponseMeta.mo

module {
    public type ActivitySubscriptionDeleteResponseMeta = {
        /// Number of active subscriptions remaining.
        total_subscriptions : ?Int;
    };

    public module JSON {
        // `init` constructs a ActivitySubscriptionDeleteResponseMeta from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ActivitySubscriptionDeleteResponseMeta.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ActivitySubscriptionDeleteResponseMeta {
            let ?res = from_candid(to_candid(required)) : ?ActivitySubscriptionDeleteResponseMeta else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ActivitySubscriptionDeleteResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.total_subscriptions) {
                case (?v__) List.add(buf, ("total_subscriptions", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionDeleteResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let total_subscriptions : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_subscriptions")) {
                        case (?total_subscriptions_field) ((switch (total_subscriptions_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        total_subscriptions;
                    };
                };
                case _ null;
            };
    };
};
