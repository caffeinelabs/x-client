import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SubscriptionsListGetResponseDataSubscriptionsInner.mo

module {
    public type SubscriptionsListGetResponseDataSubscriptionsInner = {
        /// The ID of the user the webhook is subscribed to
        user_id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : SubscriptionsListGetResponseDataSubscriptionsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.user_id) {
                case (?v__) List.add(buf, ("user_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubscriptionsListGetResponseDataSubscriptionsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let user_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_id")) {
                        case (?user_id_field) ((switch (user_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        user_id;
                    };
                };
                case _ null;
            };
    };
};
