
// UserVerifiedType.mo
/// The X Blue verified type of the user, eg: blue, government, business or none.
/// Enum values: #blue, #government, #business, #none_

module {
    // User-facing type: type-safe variants for application code
    public type UserVerifiedType = {
        #blue;
        #government;
        #business;
        #none_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserVerifiedType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserVerifiedType) : JSON =
            switch (value) {
                case (#blue) "blue";
                case (#government) "government";
                case (#business) "business";
                case (#none_) "none";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserVerifiedType =
            switch (json) {
                case "blue" ?#blue;
                case "government" ?#government;
                case "business" ?#business;
                case "none" ?#none_;
                case _ null;
            };
    }
}
