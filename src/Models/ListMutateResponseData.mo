import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ListMutateResponseData.mo

module {
    public type ListMutateResponseData = {
        is_member : ?Bool;
    };

    public module JSON {
        // `init` constructs a ListMutateResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ListMutateResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ListMutateResponseData {
            let ?res = from_candid(to_candid(required)) : ?ListMutateResponseData else Runtime.unreachable();
            res
        };

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
