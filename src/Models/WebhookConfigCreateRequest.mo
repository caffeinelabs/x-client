import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// WebhookConfigCreateRequest.mo

module {
    public type WebhookConfigCreateRequest = {
        url : Text;
    };

    public module JSON {
        public func toCandidValue(value : WebhookConfigCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("url", #Text(value.url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookConfigCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url") else return null;
                    let ?url = ((switch (url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        url;
                    };
                };
                case _ null;
            };
    };
};
