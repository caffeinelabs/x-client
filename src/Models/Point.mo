/// A [GeoJson Point](https://tools.ietf.org/html/rfc7946#section-3.1.2) geometry object.

import { type PointType; JSON = PointType } "./PointType";

// Point.mo

module {
    // User-facing type: what application code uses
    public type Point = {
        /// A [GeoJson Position](https://tools.ietf.org/html/rfc7946#section-3.1.1) in the format `[longitude,latitude]`.
        coordinates : [Float];
        type_ : PointType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Point type
        public type JSON = {
            coordinates : [Float];
            type_ : PointType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Point) : JSON = { value with
            type_ = PointType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Point {
            let ?type_ = PointType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };
    }
}
