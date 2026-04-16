/// Telephone information for the account holder.

// PlaidTelephone.mo

module {
    // User-facing type: what application code uses
    public type PlaidTelephone = {
        /// The country code for the phone number (e.g., '+1').
        country : Text;
        /// The phone number.
        number : Text;
        /// The type of phone number (e.g., 'mobile').
        type_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidTelephone type
        public type JSON = {
            country : Text;
            number : Text;
            type_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidTelephone) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidTelephone = ?json;
    }
}
