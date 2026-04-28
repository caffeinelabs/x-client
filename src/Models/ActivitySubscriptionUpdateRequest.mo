import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ActivitySubscriptionUpdateRequest.mo

module {
    public type ActivitySubscriptionUpdateRequest = {
        tag : ?Text;
        /// The unique identifier of this webhook config.
        webhook_id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ActivitySubscriptionUpdateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.tag) {
                case (?v__) List.add(buf, ("tag", #Text(v__)));
                case null ();
            };
            switch (value.webhook_id) {
                case (?v__) List.add(buf, ("webhook_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionUpdateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let tag : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag")) {
                        case (?tag_field) ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let webhook_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_id")) {
                        case (?webhook_id_field) ((switch (webhook_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        tag;
                        webhook_id;
                    };
                };
                case _ null;
            };
    };
};
