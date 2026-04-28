/// A user id for the plaid customer
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PlaidCustomer.mo

module {
    public type PlaidCustomer = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        customerId : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : PlaidCustomer) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.customerId) {
                case (?v__) List.add(buf, ("customerId", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidCustomer =
            switch (candid) {
                case (#Record(fields)) {
                    let customerId : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "customerId")) {
                        case (?customerId_field) ((switch (customerId_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        customerId;
                    };
                };
                case _ null;
            };
    };
};
