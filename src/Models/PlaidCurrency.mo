/// Currency information.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PlaidCurrency.mo

module {
    public type PlaidCurrency = {
        /// The ISO 4217 currency code.
        currencyCode : Text;
    };

    public module JSON {
        public func toCandidValue(value : PlaidCurrency) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("currencyCode", #Text(value.currencyCode)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidCurrency =
            switch (candid) {
                case (#Record(fields)) {
                    let ?currencyCode_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "currencyCode") else return null;
                    let ?currencyCode = ((switch (currencyCode_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        currencyCode;
                    };
                };
                case _ null;
            };
    };
};
