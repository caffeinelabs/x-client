
import { type ActivitySubscription; JSON = ActivitySubscription } "./ActivitySubscription";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivitySubscriptionCreateResponseData.mo

module {
    /// The required-fields slice of ActivitySubscriptionCreateResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ActivitySubscriptionCreateResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        subscription : ?ActivitySubscription;
        total_subscriptions_for_instance_id : ?Int;
    };

    public type ActivitySubscriptionCreateResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a ActivitySubscriptionCreateResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ActivitySubscriptionCreateResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ActivitySubscriptionCreateResponseData {
            let ?res = from_candid(to_candid(required)) : ?ActivitySubscriptionCreateResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ActivitySubscriptionCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.subscription) {
                case (?v__) List.add(buf, ("subscription", ActivitySubscription.toCandidValue(v__)));
                case null ();
            };
            switch (value.total_subscriptions_for_instance_id) {
                case (?v__) List.add(buf, ("total_subscriptions_for_instance_id", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let subscription : ?ActivitySubscription = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscription")) {
                        case (?subscription_field) (ActivitySubscription.fromCandidValue(subscription_field.1));
                        case null null;
                    };
                    let total_subscriptions_for_instance_id : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_subscriptions_for_instance_id")) {
                        case (?total_subscriptions_for_instance_id_field) ((switch (total_subscriptions_for_instance_id_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        subscription;
                        total_subscriptions_for_instance_id;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
