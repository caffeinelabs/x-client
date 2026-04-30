/// An XActivity subscription.

import { type ActivitySubscriptionFilter; JSON = ActivitySubscriptionFilter } "./ActivitySubscriptionFilter";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivitySubscription.mo

module {
    /// The required-fields slice of ActivitySubscription — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        created_at : Text;
        event_type : Text;
        filter : ActivitySubscriptionFilter;
        /// The unique identifier of this subscription.
        subscription_id : Text;
        updated_at : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ActivitySubscription as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        tag : ?Text;
        webhook_id : ?Text;
    };

    public type ActivitySubscription = Required and Optional;

    public module JSON {
        // `init` constructs a ActivitySubscription from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ActivitySubscription.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ActivitySubscription {
            let ?res = from_candid(to_candid(required)) : ?ActivitySubscription else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ActivitySubscription) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("created_at", #Text(value.created_at)));
            List.add(buf, ("event_type", #Text(value.event_type)));
            List.add(buf, ("filter", ActivitySubscriptionFilter.toCandidValue(value.filter)));
            List.add(buf, ("subscription_id", #Text(value.subscription_id)));
            switch (value.tag) {
                case (?v__) List.add(buf, ("tag", #Text(v__)));
                case null ();
            };
            List.add(buf, ("updated_at", #Text(value.updated_at)));
            switch (value.webhook_id) {
                case (?v__) List.add(buf, ("webhook_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscription =
            switch (candid) {
                case (#Record(fields)) {
                    let ?created_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at") else return null;
                    let ?created_at = ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?event_type_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_type") else return null;
                    let ?event_type = ((switch (event_type_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?filter_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "filter") else return null;
                    let ?filter = (ActivitySubscriptionFilter.fromCandidValue(filter_field.1)) else return null;
                    let ?subscription_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscription_id") else return null;
                    let ?subscription_id = ((switch (subscription_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let tag : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag")) {
                        case (?tag_field) ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?updated_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "updated_at") else return null;
                    let ?updated_at = ((switch (updated_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let webhook_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_id")) {
                        case (?webhook_id_field) ((switch (webhook_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        created_at;
                        event_type;
                        filter;
                        subscription_id;
                        tag;
                        updated_at;
                        webhook_id;
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
