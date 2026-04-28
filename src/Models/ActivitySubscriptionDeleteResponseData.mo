import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ActivitySubscriptionDeleteResponseData.mo

module {
    public type ActivitySubscriptionDeleteResponseData = {
        deleted : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : ActivitySubscriptionDeleteResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.deleted) {
                case (?v__) List.add(buf, ("deleted", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionDeleteResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let deleted : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "deleted")) {
                        case (?deleted_field) ((switch (deleted_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        deleted;
                    };
                };
                case _ null;
            };
    };
};
