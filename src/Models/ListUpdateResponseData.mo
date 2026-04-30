import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ListUpdateResponseData.mo

module {
    public type ListUpdateResponseData = {
        updated : ?Bool;
    };

    public module JSON {
        // `init` constructs a ListUpdateResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ListUpdateResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ListUpdateResponseData {
            let ?res = from_candid(to_candid(required)) : ?ListUpdateResponseData else Runtime.unreachable();
            res
        };

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
