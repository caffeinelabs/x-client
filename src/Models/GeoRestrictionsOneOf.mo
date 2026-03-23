
// GeoRestrictionsOneOf.mo

module {
    // User-facing type: what application code uses
    public type GeoRestrictionsOneOf = {
        /// List of blacklisted country codes
        blacklisted_country_codes : [Text];
        /// List of whitelisted country codes
        whitelisted_country_codes : [Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GeoRestrictionsOneOf type
        public type JSON = {
            blacklisted_country_codes : [Text];
            whitelisted_country_codes : [Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GeoRestrictionsOneOf) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GeoRestrictionsOneOf = ?json;
    }
}
