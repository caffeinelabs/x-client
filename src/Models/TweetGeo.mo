
import { type Point; JSON = Point } "./Point";

// TweetGeo.mo
/// The location tagged on the Tweet, if the user provided one.

module {
    // User-facing type: what application code uses
    public type TweetGeo = {
        coordinates : ?Point;
        /// The identifier for this place.
        place_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetGeo type
        public type JSON = {
            coordinates : ?Point.JSON;
            place_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetGeo) : JSON = { value with
            coordinates = do ? { Point.toJSON(value.coordinates!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetGeo {
            ?{ json with
                coordinates = do ? { Point.fromJSON(json.coordinates!)! };
            }
        };
    }
}
