import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ListMutateResponseData.mo

module {
    public type ListMutateResponseData = {
        is_member : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : ListMutateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.is_member) {
                case (?v__) List.add(buf, ("is_member", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListMutateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let is_member : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "is_member")) {
                        case (?is_member_field) ((switch (is_member_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        is_member;
                    };
                };
                case _ null;
            };
    };
};
