
// UserSubscriptionType.mo
/// The X Blue subscription type of the user, eg: Basic, Premium, PremiumPlus or None.
/// Enum values: #basic, #premium, #premiumplus, #none_

module {
    // User-facing type: type-safe variants for application code
    public type UserSubscriptionType = {
        #basic;
        #premium;
        #premiumplus;
        #none_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserSubscriptionType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserSubscriptionType) : JSON =
            switch (value) {
                case (#basic) "Basic";
                case (#premium) "Premium";
                case (#premiumplus) "PremiumPlus";
                case (#none_) "None";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserSubscriptionType =
            switch (json) {
                case "Basic" ?#basic;
                case "Premium" ?#premium;
                case "PremiumPlus" ?#premiumplus;
                case "None" ?#none_;
                case _ null;
            };
    }
}
