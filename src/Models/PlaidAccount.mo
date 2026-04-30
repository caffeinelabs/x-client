/// Descriptor for a Plaid account.

import { type PlaidCurrency; JSON = PlaidCurrency } "./PlaidCurrency";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PlaidAccount.mo

module {
    public type PlaidAccount = {
        /// The category of the account (e.g., personal, business).
        accountCategory : Text;
        /// The Plaid account ID.
        accountId : Text;
        /// The last 2-4 digits of the account number.
        accountNumberDisplay : Text;
        /// The type of the account (e.g., checking, savings).
        accountType : Text;
        /// The available balance of the account.
        availableBalance : ?Float;
        currency : PlaidCurrency;
        /// The current balance of the account.
        currentBalance : ?Float;
        /// The nickname of the account.
        nickname : ?Text;
        /// The name of the product associated with the account.
        productName : Text;
        /// The status of the account.
        status : Text;
    };

    public module JSON {
        // `init` constructs a PlaidAccount from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PlaidAccount.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            accountCategory : Text;
            accountId : Text;
            accountNumberDisplay : Text;
            accountType : Text;
            currency : PlaidCurrency;
            productName : Text;
            status : Text;
        }) : PlaidAccount {
            let ?res = from_candid(to_candid(required)) : ?PlaidAccount else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PlaidAccount) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("accountCategory", #Text(value.accountCategory)));
            List.add(buf, ("accountId", #Text(value.accountId)));
            List.add(buf, ("accountNumberDisplay", #Text(value.accountNumberDisplay)));
            List.add(buf, ("accountType", #Text(value.accountType)));
            switch (value.availableBalance) {
                case (?v__) List.add(buf, ("availableBalance", #Float(v__)));
                case null ();
            };
            List.add(buf, ("currency", PlaidCurrency.toCandidValue(value.currency)));
            switch (value.currentBalance) {
                case (?v__) List.add(buf, ("currentBalance", #Float(v__)));
                case null ();
            };
            switch (value.nickname) {
                case (?v__) List.add(buf, ("nickname", #Text(v__)));
                case null ();
            };
            List.add(buf, ("productName", #Text(value.productName)));
            List.add(buf, ("status", #Text(value.status)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidAccount =
            switch (candid) {
                case (#Record(fields)) {
                    let ?accountCategory_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "accountCategory") else return null;
                    let ?accountCategory = ((switch (accountCategory_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?accountId_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "accountId") else return null;
                    let ?accountId = ((switch (accountId_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?accountNumberDisplay_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "accountNumberDisplay") else return null;
                    let ?accountNumberDisplay = ((switch (accountNumberDisplay_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?accountType_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "accountType") else return null;
                    let ?accountType = ((switch (accountType_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let availableBalance : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "availableBalance")) {
                        case (?availableBalance_field) ((switch (availableBalance_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let ?currency_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "currency") else return null;
                    let ?currency = (PlaidCurrency.fromCandidValue(currency_field.1)) else return null;
                    let currentBalance : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "currentBalance")) {
                        case (?currentBalance_field) ((switch (currentBalance_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let nickname : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "nickname")) {
                        case (?nickname_field) ((switch (nickname_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?productName_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "productName") else return null;
                    let ?productName = ((switch (productName_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?status_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status") else return null;
                    let ?status = ((switch (status_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        accountCategory;
                        accountId;
                        accountNumberDisplay;
                        accountType;
                        availableBalance;
                        currency;
                        currentBalance;
                        nickname;
                        productName;
                        status;
                    };
                };
                case _ null;
            };
    };
};
