
import { type ActivitySubscription; JSON = ActivitySubscription } "./ActivitySubscription";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ActivitySubscriptionUpdateResponseData.mo

module {
    public type ActivitySubscriptionUpdateResponseData = {
        subscription : ?ActivitySubscription;
        /// Number of active subscriptions.
        total_subscriptions : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : ActivitySubscriptionUpdateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.subscription) {
                case (?v__) List.add(buf, ("subscription", ActivitySubscription.toCandidValue(v__)));
                case null ();
            };
            switch (value.total_subscriptions) {
                case (?v__) List.add(buf, ("total_subscriptions", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionUpdateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let subscription : ?ActivitySubscription = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscription")) {
                        case (?subscription_field) (ActivitySubscription.fromCandidValue(subscription_field.1));
                        case null null;
                    };
                    let total_subscriptions : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_subscriptions")) {
                        case (?total_subscriptions_field) ((switch (total_subscriptions_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        subscription;
                        total_subscriptions;
                    };
                };
                case _ null;
            };
    };
};
