import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ListUpdateResponseData.mo

module {
    public type ListUpdateResponseData = {
        updated : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : ListUpdateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.updated) {
                case (?v__) List.add(buf, ("updated", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListUpdateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let updated : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "updated")) {
                        case (?updated_field) ((switch (updated_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        updated;
                    };
                };
                case _ null;
            };
    };
};
