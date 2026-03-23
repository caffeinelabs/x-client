
// MarketplaceHandleAvailability.mo

module {
    // User-facing type: what application code uses
    public type MarketplaceHandleAvailability = {
        /// Availability state of the handle.
        availability_state : Text;
        /// Redirect URL for marketplace handle search.
        redirect_url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MarketplaceHandleAvailability type
        public type JSON = {
            availability_state : Text;
            redirect_url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MarketplaceHandleAvailability) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MarketplaceHandleAvailability = ?json;
    }
}
