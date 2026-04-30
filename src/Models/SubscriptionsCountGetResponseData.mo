/// The count of active subscriptions across all webhooks
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SubscriptionsCountGetResponseData.mo

module {
    /// The required-fields slice of SubscriptionsCountGetResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The account name
        account_name : Text;
        /// The limit for subscriptions for this app
        provisioned_count : Text;
        /// The number of active subscriptions across all webhooks
        subscriptions_count_all : Text;
        /// The number of active direct message subscriptions
        subscriptions_count_direct_messages : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express SubscriptionsCountGetResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type SubscriptionsCountGetResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a SubscriptionsCountGetResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SubscriptionsCountGetResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : SubscriptionsCountGetResponseData {
            let ?res = from_candid(to_candid(required)) : ?SubscriptionsCountGetResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : SubscriptionsCountGetResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("account_name", #Text(value.account_name)));
            List.add(buf, ("provisioned_count", #Text(value.provisioned_count)));
            List.add(buf, ("subscriptions_count_all", #Text(value.subscriptions_count_all)));
            List.add(buf, ("subscriptions_count_direct_messages", #Text(value.subscriptions_count_direct_messages)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubscriptionsCountGetResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?account_name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "account_name") else return null;
                    let ?account_name = ((switch (account_name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?provisioned_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "provisioned_count") else return null;
                    let ?provisioned_count = ((switch (provisioned_count_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?subscriptions_count_all_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscriptions_count_all") else return null;
                    let ?subscriptions_count_all = ((switch (subscriptions_count_all_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?subscriptions_count_direct_messages_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscriptions_count_direct_messages") else return null;
                    let ?subscriptions_count_direct_messages = ((switch (subscriptions_count_direct_messages_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        account_name;
                        provisioned_count;
                        subscriptions_count_all;
                        subscriptions_count_direct_messages;
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
