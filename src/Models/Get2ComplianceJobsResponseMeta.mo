
// Get2ComplianceJobsResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type Get2ComplianceJobsResponseMeta = {
        /// The number of results returned in this response.
        result_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2ComplianceJobsResponseMeta type
        public type JSON = {
            result_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2ComplianceJobsResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2ComplianceJobsResponseMeta = ?json;
    }
}
