
// ConnectionExceptionProblemAllOfConnectionIssue.mo
/// Enum values: #toomanyconnections, #provisioningsubscription, #ruleconfigurationissue, #rulesinvalidissue

module {
    // User-facing type: type-safe variants for application code
    public type ConnectionExceptionProblemAllOfConnectionIssue = {
        #toomanyconnections;
        #provisioningsubscription;
        #ruleconfigurationissue;
        #rulesinvalidissue;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ConnectionExceptionProblemAllOfConnectionIssue type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ConnectionExceptionProblemAllOfConnectionIssue) : JSON =
            switch (value) {
                case (#toomanyconnections) "TooManyConnections";
                case (#provisioningsubscription) "ProvisioningSubscription";
                case (#ruleconfigurationissue) "RuleConfigurationIssue";
                case (#rulesinvalidissue) "RulesInvalidIssue";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ConnectionExceptionProblemAllOfConnectionIssue =
            switch (json) {
                case "TooManyConnections" ?#toomanyconnections;
                case "ProvisioningSubscription" ?#provisioningsubscription;
                case "RuleConfigurationIssue" ?#ruleconfigurationissue;
                case "RulesInvalidIssue" ?#rulesinvalidissue;
                case _ null;
            };
    }
}
