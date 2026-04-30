/// Contact information associated with a Plaid account.

import { type PlaidAddress; JSON = PlaidAddress } "./PlaidAddress";

import { type PlaidName; JSON = PlaidName } "./PlaidName";

import { type PlaidTelephone; JSON = PlaidTelephone } "./PlaidTelephone";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PlaidAccountContact.mo

module {
    public type PlaidAccountContact = {
        /// List of addresses associated with the account holder.
        addresses : [PlaidAddress];
        /// List of email addresses associated with the account holder.
        emails : [Text];
        name : PlaidName;
        /// Relationship of the contact to the account.
        relationship : ?Text;
        /// List of telephone numbers associated with the account holder.
        telephones : [PlaidTelephone];
    };

    public module JSON {
        // `init` constructs a PlaidAccountContact from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PlaidAccountContact.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            addresses : [PlaidAddress];
            emails : [Text];
            name : PlaidName;
            telephones : [PlaidTelephone];
        }) : PlaidAccountContact {
            let ?res = from_candid(to_candid(required)) : ?PlaidAccountContact else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PlaidAccountContact) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("addresses", #Array(Array.map<PlaidAddress, Candid.Candid>(value.addresses, PlaidAddress.toCandidValue))));
            List.add(buf, ("emails", #Array(Array.map<Text, Candid.Candid>(value.emails, func(s : Text) : Candid.Candid = #Text(s)))));
            List.add(buf, ("name", PlaidName.toCandidValue(value.name)));
            switch (value.relationship) {
                case (?v__) List.add(buf, ("relationship", #Text(v__)));
                case null ();
            };
            List.add(buf, ("telephones", #Array(Array.map<PlaidTelephone, Candid.Candid>(value.telephones, PlaidTelephone.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidAccountContact =
            switch (candid) {
                case (#Record(fields)) {
                    let ?addresses_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "addresses") else return null;
                    let ?addresses = ((switch (addresses_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<PlaidAddress>();
                            for (c__ in xs__.values()) {
                                let ?m__ = PlaidAddress.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?emails_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "emails") else return null;
                    let ?emails = ((switch (emails_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = (PlaidName.fromCandidValue(name_field.1)) else return null;
                    let relationship : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "relationship")) {
                        case (?relationship_field) ((switch (relationship_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?telephones_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "telephones") else return null;
                    let ?telephones = ((switch (telephones_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<PlaidTelephone>();
                            for (c__ in xs__.values()) {
                                let ?m__ = PlaidTelephone.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        addresses;
                        emails;
                        name;
                        relationship;
                        telephones;
                    };
                };
                case _ null;
            };
    };
};
