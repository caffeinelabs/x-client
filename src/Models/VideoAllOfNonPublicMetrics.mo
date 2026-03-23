
// VideoAllOfNonPublicMetrics.mo
/// Nonpublic engagement metrics for the Media at the time of the request.

module {
    // User-facing type: what application code uses
    public type VideoAllOfNonPublicMetrics = {
        /// Number of users who made it through 0% of the video.
        playback_0_count : ?Int;
        /// Number of users who made it through 100% of the video.
        playback_100_count : ?Int;
        /// Number of users who made it through 25% of the video.
        playback_25_count : ?Int;
        /// Number of users who made it through 50% of the video.
        playback_50_count : ?Int;
        /// Number of users who made it through 75% of the video.
        playback_75_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer VideoAllOfNonPublicMetrics type
        public type JSON = {
            playback_0_count : ?Int;
            playback_100_count : ?Int;
            playback_25_count : ?Int;
            playback_50_count : ?Int;
            playback_75_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : VideoAllOfNonPublicMetrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?VideoAllOfNonPublicMetrics = ?json;
    }
}
