
import { type FullTextEntities; JSON = FullTextEntities } "./FullTextEntities";

import { type UserEntitiesUrl; JSON = UserEntitiesUrl } "./UserEntitiesUrl";

// UserEntities.mo
/// A list of metadata found in the User's profile description.

module {
    // User-facing type: what application code uses
    public type UserEntities = {
        description : ?FullTextEntities;
        url : ?UserEntitiesUrl;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserEntities type
        public type JSON = {
            description : ?FullTextEntities;
            url : ?UserEntitiesUrl;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserEntities) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserEntities = ?json;
    }
}
