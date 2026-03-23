
// DomainRestrictions.mo

module {
    // User-facing type: what application code uses
    public type DomainRestrictions = {
        /// List of whitelisted domains
        whitelist : [Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DomainRestrictions type
        public type JSON = {
            whitelist : [Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DomainRestrictions) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DomainRestrictions = ?json;
    }
}
