/// Represent the portion of text recognized as a Cashtag, and its start and end position within the text.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CashtagFields.mo

module {
    public type CashtagFields = {
        tag : Text;
    };

    public module JSON {
        // `init` constructs a CashtagFields from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CashtagFields.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            tag : Text;
        }) : CashtagFields {
            let ?res = from_candid(to_candid(required)) : ?CashtagFields else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CashtagFields) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("tag", #Text(value.tag)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CashtagFields =
            switch (candid) {
                case (#Record(fields)) {
                    let ?tag_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag") else return null;
                    let ?tag = ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        tag;
                    };
                };
                case _ null;
            };
    };
};
