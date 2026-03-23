
// UsageCapExceededProblemAllOfScope.mo
/// Enum values: #account, #product

module {
    // User-facing type: type-safe variants for application code
    public type UsageCapExceededProblemAllOfScope = {
        #account;
        #product;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsageCapExceededProblemAllOfScope type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsageCapExceededProblemAllOfScope) : JSON =
            switch (value) {
                case (#account) "Account";
                case (#product) "Product";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsageCapExceededProblemAllOfScope =
            switch (json) {
                case "Account" ?#account;
                case "Product" ?#product;
                case _ null;
            };
    }
}
