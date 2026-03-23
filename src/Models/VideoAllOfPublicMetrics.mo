
// VideoAllOfPublicMetrics.mo
/// Engagement metrics for the Media at the time of the request.

module {
    // User-facing type: what application code uses
    public type VideoAllOfPublicMetrics = {
        /// Number of times this video has been viewed.
        view_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer VideoAllOfPublicMetrics type
        public type JSON = {
            view_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : VideoAllOfPublicMetrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?VideoAllOfPublicMetrics = ?json;
    }
}
