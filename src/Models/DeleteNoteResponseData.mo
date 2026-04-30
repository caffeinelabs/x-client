import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DeleteNoteResponseData.mo

module {
    public type DeleteNoteResponseData = {
        deleted : Bool;
    };

    public module JSON {
        // `init` constructs a DeleteNoteResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { DeleteNoteResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            deleted : Bool;
        }) : DeleteNoteResponseData {
            let ?res = from_candid(to_candid(required)) : ?DeleteNoteResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : DeleteNoteResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("deleted", #Bool(value.deleted)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteNoteResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?deleted_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "deleted") else return null;
                    let ?deleted = ((switch (deleted_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        deleted;
                    };
                };
                case _ null;
            };
    };
};
