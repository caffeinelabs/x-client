import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebhookReplayCreateRequest.mo

module {
    /// The required-fields slice of WebhookReplayCreateRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The oldest (starting) UTC timestamp (inclusive) from which events will be provided, in yyyymmddhhmm format.
        from_date : Text;
        /// The oldest (starting) UTC timestamp (inclusive) from which events will be provided, in yyyymmddhhmm format.
        to_date : Text;
        /// The unique identifier of this webhook config.
        webhook_id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express WebhookReplayCreateRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type WebhookReplayCreateRequest = Required and Optional;

    public module JSON {
        // `init` constructs a WebhookReplayCreateRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebhookReplayCreateRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : WebhookReplayCreateRequest {
            let ?res = from_candid(to_candid(required)) : ?WebhookReplayCreateRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebhookReplayCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("from_date", #Text(value.from_date)));
            List.add(buf, ("to_date", #Text(value.to_date)));
            List.add(buf, ("webhook_id", #Text(value.webhook_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookReplayCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?from_date_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "from_date") else return null;
                    let ?from_date = ((switch (from_date_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?to_date_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "to_date") else return null;
                    let ?to_date = ((switch (to_date_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?webhook_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_id") else return null;
                    let ?webhook_id = ((switch (webhook_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        from_date;
                        to_date;
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
