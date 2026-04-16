/// Contact information associated with a Plaid account.

import { type PlaidAddress; JSON = PlaidAddress } "./PlaidAddress";

import { type PlaidName; JSON = PlaidName } "./PlaidName";

import { type PlaidTelephone; JSON = PlaidTelephone } "./PlaidTelephone";

// PlaidAccountContact.mo

module {
    // User-facing type: what application code uses
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidAccountContact type
        public type JSON = {
            addresses : [PlaidAddress];
            emails : [Text];
            name : PlaidName;
            relationship : ?Text;
            telephones : [PlaidTelephone];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidAccountContact) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidAccountContact = ?json;
    }
}
