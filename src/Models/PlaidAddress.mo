/// Address information for the account holder.

// PlaidAddress.mo

module {
    // User-facing type: what application code uses
    public type PlaidAddress = {
        /// The city of the address.
        city : Text;
        /// The country of the address (ISO 3166-1 alpha-2 code).
        country : Text;
        /// The first line of the address.
        line1 : Text;
        /// The second line of the address.
        line2 : ?Text;
        /// The postal code of the address.
        postalCode : ?Text;
        /// The region or state of the address.
        region_ : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidAddress type
        public type JSON = {
            city : Text;
            country : Text;
            line1 : Text;
            line2 : ?Text;
            postalCode : ?Text;
            region_ : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidAddress) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidAddress = ?json;
    }
}
