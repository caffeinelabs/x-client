/// The list of active subscriptions for a specified webhook

import { type SubscriptionsListGetResponseDataSubscriptionsInner; JSON = SubscriptionsListGetResponseDataSubscriptionsInner } "./SubscriptionsListGetResponseDataSubscriptionsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SubscriptionsListGetResponseData.mo

module {
    /// The required-fields slice of SubscriptionsListGetResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The application ID
        application_id : Text;
        /// List of active subscriptions for the webhook
        subscriptions : [SubscriptionsListGetResponseDataSubscriptionsInner];
        /// The associated webhook ID
        webhook_id : Text;
        /// The url for the associated webhook
        webhook_url : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express SubscriptionsListGetResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type SubscriptionsListGetResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a SubscriptionsListGetResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SubscriptionsListGetResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : SubscriptionsListGetResponseData {
            let ?res = from_candid(to_candid(required)) : ?SubscriptionsListGetResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : SubscriptionsListGetResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("application_id", #Text(value.application_id)));
            List.add(buf, ("subscriptions", #Array(Array.map<SubscriptionsListGetResponseDataSubscriptionsInner, Candid.Candid>(value.subscriptions, SubscriptionsListGetResponseDataSubscriptionsInner.toCandidValue))));
            List.add(buf, ("webhook_id", #Text(value.webhook_id)));
            List.add(buf, ("webhook_url", #Text(value.webhook_url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubscriptionsListGetResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?application_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "application_id") else return null;
                    let ?application_id = ((switch (application_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?subscriptions_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscriptions") else return null;
                    let ?subscriptions = ((switch (subscriptions_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<SubscriptionsListGetResponseDataSubscriptionsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = SubscriptionsListGetResponseDataSubscriptionsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?webhook_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_id") else return null;
                    let ?webhook_id = ((switch (webhook_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?webhook_url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_url") else return null;
                    let ?webhook_url = ((switch (webhook_url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        application_id;
                        subscriptions;
                        webhook_id;
                        webhook_url;
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
