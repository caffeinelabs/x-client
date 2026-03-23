
// CreateComplianceJobRequestType.mo
/// Type of compliance job to list.
/// Enum values: #tweets, #users

module {
    // User-facing type: type-safe variants for application code
    public type CreateComplianceJobRequestType = {
        #tweets;
        #users;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateComplianceJobRequestType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateComplianceJobRequestType) : JSON =
            switch (value) {
                case (#tweets) "tweets";
                case (#users) "users";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateComplianceJobRequestType =
            switch (json) {
                case "tweets" ?#tweets;
                case "users" ?#users;
                case _ null;
            };
    }
}
