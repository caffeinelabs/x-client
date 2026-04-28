import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// WebhookLinksCreateResponseData.mo

module {
    public type WebhookLinksCreateResponseData = {
        provisioned : ?Bool;
    };

    public module JSON {
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
