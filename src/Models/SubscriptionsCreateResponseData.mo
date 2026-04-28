import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SubscriptionsCreateResponseData.mo

module {
    public type SubscriptionsCreateResponseData = {
        subscribed : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : SubscriptionsCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.subscribed) {
                case (?v__) List.add(buf, ("subscribed", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubscriptionsCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let subscribed : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscribed")) {
                        case (?subscribed_field) ((switch (subscribed_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        subscribed;
                    };
                };
                case _ null;
            };
    };
};
