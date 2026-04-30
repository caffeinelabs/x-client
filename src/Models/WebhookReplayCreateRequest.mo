import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebhookReplayCreateRequest.mo

module {
    public type WebhookReplayCreateRequest = {
        /// The oldest (starting) UTC timestamp (inclusive) from which events will be provided, in yyyymmddhhmm format.
        from_date : Text;
        /// The oldest (starting) UTC timestamp (inclusive) from which events will be provided, in yyyymmddhhmm format.
        to_date : Text;
        /// The unique identifier of this webhook config.
        webhook_id : Text;
    };

    public module JSON {
        // `init` constructs a WebhookReplayCreateRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebhookReplayCreateRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            from_date : Text;
            to_date : Text;
            webhook_id : Text;
        }) : WebhookReplayCreateRequest {
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
};
