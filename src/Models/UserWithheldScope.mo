/// Indicates that the content being withheld is a `user`.

// UserWithheldScope.mo
/// Enum values: #user

module {
    // User-facing type: type-safe variants for application code
    public type UserWithheldScope = {
        #user;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserWithheldScope type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserWithheldScope) : JSON =
            switch (value) {
                case (#user) "user";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserWithheldScope =
            switch (json) {
                case "user" ?#user;
                case _ null;
            };
    }
}
