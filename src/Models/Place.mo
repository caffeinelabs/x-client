
import { type Geo; JSON = Geo } "./Geo";

import { type PlaceType; JSON = PlaceType } "./PlaceType";

// Place.mo

module {
    // User-facing type: what application code uses
    public type Place = {
        contained_within : ?[Text];
        /// The full name of the county in which this place exists.
        country : ?Text;
        /// A two-letter ISO 3166-1 alpha-2 country code.
        country_code : ?Text;
        /// The full name of this place.
        full_name : Text;
        geo : ?Geo;
        /// The identifier for this place.
        id : Text;
        /// The human readable name of this place.
        name : ?Text;
        place_type : ?PlaceType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Place type
        public type JSON = {
            contained_within : ?[Text];
            country : ?Text;
            country_code : ?Text;
            full_name : Text;
            geo : ?Geo.JSON;
            id : Text;
            name : ?Text;
            place_type : ?PlaceType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Place) : JSON = { value with
            geo = do ? { Geo.toJSON(value.geo!) };
            place_type = do ? { PlaceType.toJSON(value.place_type!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Place {
            ?{ json with
                geo = do ? { Geo.fromJSON(json.geo!)! };
                place_type = do ? { PlaceType.fromJSON(json.place_type!)! };
            }
        };
    }
}
