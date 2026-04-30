import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SubscriptionsListGetResponseDataSubscriptionsInner.mo

module {
    /// The required-fields slice of SubscriptionsListGetResponseDataSubscriptionsInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express SubscriptionsListGetResponseDataSubscriptionsInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        user_id : ?Text;
    };

    public type SubscriptionsListGetResponseDataSubscriptionsInner = Required and Optional;

    public module JSON {
        // `init` constructs a SubscriptionsListGetResponseDataSubscriptionsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SubscriptionsListGetResponseDataSubscriptionsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : SubscriptionsListGetResponseDataSubscriptionsInner {
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
