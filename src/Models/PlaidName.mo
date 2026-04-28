/// Name information for the account holder.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PlaidName.mo

module {
    public type PlaidName = {
        /// The first name of the account holder.
        first : Text;
        /// The last name of the account holder.
        last : Text;
    };

    public module JSON {
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
