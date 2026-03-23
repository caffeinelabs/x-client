
// AudiencePolicyCreatorSubscriptionsInner.mo
/// Enum values: #any_

module {
    // User-facing type: type-safe variants for application code
    public type AudiencePolicyCreatorSubscriptionsInner = {
        #any_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AudiencePolicyCreatorSubscriptionsInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AudiencePolicyCreatorSubscriptionsInner) : JSON =
            switch (value) {
                case (#any_) "Any";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AudiencePolicyCreatorSubscriptionsInner =
            switch (json) {
                case "Any" ?#any_;
                case _ null;
            };
    }
}
