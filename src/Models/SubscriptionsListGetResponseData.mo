/// The list of active subscriptions for a specified webhook

import { type SubscriptionsListGetResponseDataSubscriptionsInner; JSON = SubscriptionsListGetResponseDataSubscriptionsInner } "./SubscriptionsListGetResponseDataSubscriptionsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SubscriptionsListGetResponseData.mo

module {
    public type SubscriptionsListGetResponseData = {
        /// The application ID
        application_id : Text;
        /// List of active subscriptions for the webhook
        subscriptions : [SubscriptionsListGetResponseDataSubscriptionsInner];
        /// The associated webhook ID
        webhook_id : Text;
        /// The url for the associated webhook
        webhook_url : Text;
    };

    public module JSON {
        public func toCandidValue(value : SubscriptionsListGetResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("application_id", #Text(value.application_id)));
            List.add(buf, ("subscriptions", #Array(Array.map<SubscriptionsListGetResponseDataSubscriptionsInner, Candid.Candid>(value.subscriptions, SubscriptionsListGetResponseDataSubscriptionsInner.toCandidValue))));
            List.add(buf, ("webhook_id", #Text(value.webhook_id)));
            List.add(buf, ("webhook_url", #Text(value.webhook_url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubscriptionsListGetResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?application_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "application_id") else return null;
                    let ?application_id = ((switch (application_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?subscriptions_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscriptions") else return null;
                    let ?subscriptions = ((switch (subscriptions_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<SubscriptionsListGetResponseDataSubscriptionsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = SubscriptionsListGetResponseDataSubscriptionsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?webhook_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_id") else return null;
                    let ?webhook_id = ((switch (webhook_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?webhook_url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_url") else return null;
                    let ?webhook_url = ((switch (webhook_url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        application_id;
                        subscriptions;
                        webhook_id;
                        webhook_url;
                    };
                };
                case _ null;
            };
    };
};
