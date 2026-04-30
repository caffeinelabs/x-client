/// A Webhook Configuration
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebhookConfig.mo

module {
    public type WebhookConfig = {
        created_at : Text;
        /// The unique identifier of this webhook config.
        id : Text;
        /// The callback URL of the webhook.
        url : Text;
        valid : Bool;
    };

    public module JSON {
        // `init` constructs a WebhookConfig from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebhookConfig.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            created_at : Text;
            id : Text;
            url : Text;
            valid : Bool;
        }) : WebhookConfig {
            let ?res = from_candid(to_candid(required)) : ?WebhookConfig else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebhookConfig) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("created_at", #Text(value.created_at)));
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("url", #Text(value.url)));
            List.add(buf, ("valid", #Bool(value.valid)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookConfig =
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
};
