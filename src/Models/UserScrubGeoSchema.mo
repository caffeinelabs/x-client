
import { type UserScrubGeoObjectSchema; JSON = UserScrubGeoObjectSchema } "./UserScrubGeoObjectSchema";

// UserScrubGeoSchema.mo

module {
    // User-facing type: what application code uses
    public type UserScrubGeoSchema = {
        scrub_geo : UserScrubGeoObjectSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserScrubGeoSchema type
        public type JSON = {
            scrub_geo : UserScrubGeoObjectSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserScrubGeoSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserScrubGeoSchema = ?json;
    }
}
