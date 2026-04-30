/// A Webhook Configuration
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebhookConfigCreateResponse.mo

module {
    /// The required-fields slice of WebhookConfigCreateResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        created_at : Text;
        /// The unique identifier of this webhook config.
        id : Text;
        /// The callback URL of the webhook.
        url : Text;
        valid : Bool;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express WebhookConfigCreateResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type WebhookConfigCreateResponse = Required and Optional;

    public module JSON {
        // `init` constructs a WebhookConfigCreateResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebhookConfigCreateResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : WebhookConfigCreateResponse {
            let ?res = from_candid(to_candid(required)) : ?WebhookConfigCreateResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebhookConfigCreateResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("created_at", #Text(value.created_at)));
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("url", #Text(value.url)));
            List.add(buf, ("valid", #Bool(value.valid)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookConfigCreateResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?created_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at") else return null;
                    let ?created_at = ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url") else return null;
                    let ?url = ((switch (url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?valid_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "valid") else return null;
                    let ?valid = ((switch (valid_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        created_at;
                        id;
                        url;
                        valid;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
