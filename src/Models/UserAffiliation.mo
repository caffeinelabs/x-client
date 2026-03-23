
// UserAffiliation.mo
/// Metadata about a user's affiliation.

module {
    // User-facing type: what application code uses
    public type UserAffiliation = {
        /// The badge URL corresponding to the affiliation.
        badge_url : ?Text;
        /// The description of the affiliation.
        description : ?Text;
        /// The URL, if available, to details about an affiliation.
        url : ?Text;
        user_id : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserAffiliation type
        public type JSON = {
            badge_url : ?Text;
            description : ?Text;
            url : ?Text;
            user_id : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserAffiliation) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserAffiliation = ?json;
    }
}
