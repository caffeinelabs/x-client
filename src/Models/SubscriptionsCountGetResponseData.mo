/// The count of active subscriptions across all webhooks
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SubscriptionsCountGetResponseData.mo

module {
    public type SubscriptionsCountGetResponseData = {
        /// The account name
        account_name : Text;
        /// The limit for subscriptions for this app
        provisioned_count : Text;
        /// The number of active subscriptions across all webhooks
        subscriptions_count_all : Text;
        /// The number of active direct message subscriptions
        subscriptions_count_direct_messages : Text;
    };

    public module JSON {
        public func toCandidValue(value : SubscriptionsCountGetResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("account_name", #Text(value.account_name)));
            List.add(buf, ("provisioned_count", #Text(value.provisioned_count)));
            List.add(buf, ("subscriptions_count_all", #Text(value.subscriptions_count_all)));
            List.add(buf, ("subscriptions_count_direct_messages", #Text(value.subscriptions_count_direct_messages)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubscriptionsCountGetResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?account_name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "account_name") else return null;
                    let ?account_name = ((switch (account_name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?provisioned_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "provisioned_count") else return null;
                    let ?provisioned_count = ((switch (provisioned_count_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?subscriptions_count_all_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscriptions_count_all") else return null;
                    let ?subscriptions_count_all = ((switch (subscriptions_count_all_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?subscriptions_count_direct_messages_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscriptions_count_direct_messages") else return null;
                    let ?subscriptions_count_direct_messages = ((switch (subscriptions_count_direct_messages_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        account_name;
                        provisioned_count;
                        subscriptions_count_all;
                        subscriptions_count_direct_messages;
                    };
                };
                case _ null;
            };
    };
};
