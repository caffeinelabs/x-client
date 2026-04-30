/// Descriptor for a Plaid account.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PlaidAccountTransaction.mo

module {
    /// The required-fields slice of PlaidAccountTransaction — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The category of the account (e.g., personal, business).
        accountCategory : Text;
        /// The amount transacted.
        amount : Float;
        /// Memo for transaction (e.g. CREDIT)
        debitCreditMemo : Text;
        /// The transaction description
        description : Text;
        /// The status of the transaction.
        status : Text;
        /// The identifier for the transaction.
        transactionId : Text;
        /// The timestamp when the transaction occurred.
        transactionTimestamp : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express PlaidAccountTransaction as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        postedTimestamp : ?Text;
    };

    public type PlaidAccountTransaction = Required and Optional;

    public module JSON {
        // `init` constructs a PlaidAccountTransaction from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PlaidAccountTransaction.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : PlaidAccountTransaction {
            let ?res = from_candid(to_candid(required)) : ?PlaidAccountTransaction else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PlaidAccountTransaction) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("accountCategory", #Text(value.accountCategory)));
            List.add(buf, ("amount", #Float(value.amount)));
            List.add(buf, ("debitCreditMemo", #Text(value.debitCreditMemo)));
            List.add(buf, ("description", #Text(value.description)));
            switch (value.postedTimestamp) {
                case (?v__) List.add(buf, ("postedTimestamp", #Text(v__)));
                case null ();
            };
            List.add(buf, ("status", #Text(value.status)));
            List.add(buf, ("transactionId", #Text(value.transactionId)));
            List.add(buf, ("transactionTimestamp", #Text(value.transactionTimestamp)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidAccountTransaction =
            switch (candid) {
                case (#Record(fields)) {
                    let ?accountCategory_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "accountCategory") else return null;
                    let ?accountCategory = ((switch (accountCategory_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?amount_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "amount") else return null;
                    let ?amount = ((switch (amount_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?debitCreditMemo_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "debitCreditMemo") else return null;
                    let ?debitCreditMemo = ((switch (debitCreditMemo_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?description_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description") else return null;
                    let ?description = ((switch (description_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let postedTimestamp : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "postedTimestamp")) {
                        case (?postedTimestamp_field) ((switch (postedTimestamp_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?status_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status") else return null;
                    let ?status = ((switch (status_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?transactionId_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transactionId") else return null;
                    let ?transactionId = ((switch (transactionId_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?transactionTimestamp_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transactionTimestamp") else return null;
                    let ?transactionTimestamp = ((switch (transactionTimestamp_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        accountCategory;
                        amount;
                        debitCreditMemo;
                        description;
                        postedTimestamp;
                        status;
                        transactionId;
                        transactionTimestamp;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
