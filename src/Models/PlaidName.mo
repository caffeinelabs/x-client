/// Name information for the account holder.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PlaidName.mo

module {
    public type PlaidName = {
        /// The first name of the account holder.
        first : Text;
        /// The last name of the account holder.
        last : Text;
    };

    public module JSON {
        // `init` constructs a PlaidName from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PlaidName.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            first : Text;
            last : Text;
        }) : PlaidName {
            let ?res = from_candid(to_candid(required)) : ?PlaidName else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PlaidName) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("first", #Text(value.first)));
            List.add(buf, ("last", #Text(value.last)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidName =
            switch (candid) {
                case (#Record(fields)) {
                    let ?first_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "first") else return null;
                    let ?first = ((switch (first_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?last_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "last") else return null;
                    let ?last = ((switch (last_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        first;
                        last;
                    };
                };
                case _ null;
            };
    };
};
