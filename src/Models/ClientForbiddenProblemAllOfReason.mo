
// ClientForbiddenProblemAllOfReason.mo
/// Enum values: #official_client_forbidden, #client_not_enrolled

module {
    // User-facing type: type-safe variants for application code
    public type ClientForbiddenProblemAllOfReason = {
        #official_client_forbidden;
        #client_not_enrolled;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ClientForbiddenProblemAllOfReason type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ClientForbiddenProblemAllOfReason) : JSON =
            switch (value) {
                case (#official_client_forbidden) "official-client-forbidden";
                case (#client_not_enrolled) "client-not-enrolled";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ClientForbiddenProblemAllOfReason =
            switch (json) {
                case "official-client-forbidden" ?#official_client_forbidden;
                case "client-not-enrolled" ?#client_not_enrolled;
                case _ null;
            };
    }
}
