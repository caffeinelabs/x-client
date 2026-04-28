import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// WebhookConfigPutResponseData.mo

module {
    public type WebhookConfigPutResponseData = {
        attempted : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : WebhookConfigPutResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.attempted) {
                case (?v__) List.add(buf, ("attempted", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookConfigPutResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let attempted : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "attempted")) {
                        case (?attempted_field) ((switch (attempted_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        attempted;
                    };
                };
                case _ null;
            };
    };
};
