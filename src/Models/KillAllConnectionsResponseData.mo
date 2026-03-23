
import { type KillAllConnectionsResponseDataResultsInner; JSON = KillAllConnectionsResponseDataResultsInner } "./KillAllConnectionsResponseDataResultsInner";

// KillAllConnectionsResponseData.mo

module {
    // User-facing type: what application code uses
    public type KillAllConnectionsResponseData = {
        failed_kills : ?Int;
        results : ?[KillAllConnectionsResponseDataResultsInner];
        successful_kills : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer KillAllConnectionsResponseData type
        public type JSON = {
            failed_kills : ?Int;
            results : ?[KillAllConnectionsResponseDataResultsInner];
            successful_kills : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : KillAllConnectionsResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?KillAllConnectionsResponseData = ?json;
    }
}
