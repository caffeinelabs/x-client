
import { type GeoType; JSON = GeoType } "./GeoType";

import { type Point; JSON = Point } "./Point";

// Geo.mo

module {
    // User-facing type: what application code uses
    public type Geo = {
        bbox : [Float];
        geometry : ?Point;
        properties : Any;
        type_ : GeoType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Geo type
        public type JSON = {
            bbox : [Float];
            geometry : ?Point.JSON;
            properties : Any;
            type_ : GeoType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Geo) : JSON = { value with
            geometry = do ? { Point.toJSON(value.geometry!) };
            type_ = GeoType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Geo {
            let ?type_ = GeoType.fromJSON(json.type_) else return null;
            ?{ json with
                geometry = do ? { Point.fromJSON(json.geometry!)! };
                type_;
            }
        };
    }
}
