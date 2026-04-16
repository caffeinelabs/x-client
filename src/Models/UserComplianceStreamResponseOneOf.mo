/// User compliance event.

import { type UserComplianceData; JSON = UserComplianceData } "./UserComplianceData";

// UserComplianceStreamResponseOneOf.mo

module {
    // User-facing type: what application code uses
    public type UserComplianceStreamResponseOneOf = {
        data : UserComplianceData;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserComplianceStreamResponseOneOf type
        public type JSON = {
            data : UserComplianceData;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserComplianceStreamResponseOneOf) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserComplianceStreamResponseOneOf = ?json;
    }
}
