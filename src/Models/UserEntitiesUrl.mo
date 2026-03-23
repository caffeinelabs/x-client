
import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";

// UserEntitiesUrl.mo
/// Expanded details for the URL specified in the User's profile, with start and end indices.

module {
    // User-facing type: what application code uses
    public type UserEntitiesUrl = {
        urls : ?[UrlEntity];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserEntitiesUrl type
        public type JSON = {
            urls : ?[UrlEntity];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserEntitiesUrl) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserEntitiesUrl = ?json;
    }
}
