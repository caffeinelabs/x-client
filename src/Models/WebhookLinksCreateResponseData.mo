import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebhookLinksCreateResponseData.mo

module {
    public type WebhookLinksCreateResponseData = {
        provisioned : ?Bool;
    };

    public module JSON {
        // `init` constructs a WebhookLinksCreateResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebhookLinksCreateResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : WebhookLinksCreateResponseData {
            let ?res = from_candid(to_candid(required)) : ?WebhookLinksCreateResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebhookLinksCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.provisioned) {
                case (?v__) List.add(buf, ("provisioned", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookLinksCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let provisioned : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "provisioned")) {
                        case (?provisioned_field) ((switch (provisioned_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        provisioned;
                    };
                };
                case _ null;
            };
    };
};
