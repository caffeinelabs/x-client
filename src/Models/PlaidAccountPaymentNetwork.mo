/// Payment network details associated with the account.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PlaidAccountPaymentNetwork.mo

module {
    public type PlaidAccountPaymentNetwork = {
        /// The bank ID associated with the account.
        bankId : Text;
        /// The payment network identifier.
        identifier : Text;
        /// Indicates if transfers into the account are supported.
        transferIn : Bool;
        /// Indicates if transfers out of the account are supported.
        transferOut : Bool;
        /// The type of payment network (e.g., ACH, SEPA).
        type_ : Text;
    };

    public module JSON {
        // `init` constructs a PlaidAccountPaymentNetwork from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PlaidAccountPaymentNetwork.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            bankId : Text;
            identifier : Text;
            transferIn : Bool;
            transferOut : Bool;
            type_ : Text;
        }) : PlaidAccountPaymentNetwork {
            let ?res = from_candid(to_candid(required)) : ?PlaidAccountPaymentNetwork else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PlaidAccountPaymentNetwork) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("bankId", #Text(value.bankId)));
            List.add(buf, ("identifier", #Text(value.identifier)));
            List.add(buf, ("transferIn", #Bool(value.transferIn)));
            List.add(buf, ("transferOut", #Bool(value.transferOut)));
            List.add(buf, ("type", #Text(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidAccountPaymentNetwork =
            switch (candid) {
                case (#Record(fields)) {
                    let ?bankId_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bankId") else return null;
                    let ?bankId = ((switch (bankId_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?identifier_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "identifier") else return null;
                    let ?identifier = ((switch (identifier_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?transferIn_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transferIn") else return null;
                    let ?transferIn = ((switch (transferIn_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?transferOut_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transferOut") else return null;
                    let ?transferOut = ((switch (transferOut_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = ((switch (type__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        bankId;
                        identifier;
                        transferIn;
                        transferOut;
                        type_;
                    };
                };
                case _ null;
            };
    };
};
