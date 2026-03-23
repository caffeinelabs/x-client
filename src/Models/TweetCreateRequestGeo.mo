
// TweetCreateRequestGeo.mo
/// Place ID being attached to the Tweet for geo location.

module {
    // User-facing type: what application code uses
    public type TweetCreateRequestGeo = {
        place_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateRequestGeo type
        public type JSON = {
            place_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateRequestGeo) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateRequestGeo = ?json;
    }
}
