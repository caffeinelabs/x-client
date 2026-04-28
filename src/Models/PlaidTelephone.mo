/// Telephone information for the account holder.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PlaidTelephone.mo

module {
    public type PlaidTelephone = {
        /// The country code for the phone number (e.g., '+1').
        country : Text;
        /// The phone number.
        number : Text;
        /// The type of phone number (e.g., 'mobile').
        type_ : Text;
    };

    public module JSON {
        public func toCandidValue(value : PlaidTelephone) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("country", #Text(value.country)));
            List.add(buf, ("number", #Text(value.number)));
            List.add(buf, ("type", #Text(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidTelephone =
            switch (candid) {
                case (#Record(fields)) {
                    let ?country_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "country") else return null;
                    let ?country = ((switch (country_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?number_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "number") else return null;
                    let ?number = ((switch (number_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = ((switch (type__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        country;
                        number;
                        type_;
                    };
                };
                case _ null;
            };
    };
};
