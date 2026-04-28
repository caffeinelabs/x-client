/// The list of active webhook links for a given stream

import { type WebhookLinksGetResponseDataLinksInner; JSON = WebhookLinksGetResponseDataLinksInner } "./WebhookLinksGetResponseDataLinksInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// WebhookLinksGetResponseData.mo

module {
    public type WebhookLinksGetResponseData = {
        /// list of links
        links : [WebhookLinksGetResponseDataLinksInner];
    };

    public module JSON {
        public func toCandidValue(value : WebhookLinksGetResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("links", #Array(Array.map<WebhookLinksGetResponseDataLinksInner, Candid.Candid>(value.links, WebhookLinksGetResponseDataLinksInner.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookLinksGetResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?links_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "links") else return null;
                    let ?links = ((switch (links_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<WebhookLinksGetResponseDataLinksInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = WebhookLinksGetResponseDataLinksInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        links;
                    };
                };
                case _ null;
            };
    };
};
