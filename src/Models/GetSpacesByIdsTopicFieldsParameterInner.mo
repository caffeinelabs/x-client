
// GetSpacesByIdsTopicFieldsParameterInner.mo
/// Enum values: #description, #id, #name

module {
    // User-facing type: type-safe variants for application code
    public type GetSpacesByIdsTopicFieldsParameterInner = {
        #description;
        #id;
        #name;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetSpacesByIdsTopicFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetSpacesByIdsTopicFieldsParameterInner) : JSON =
            switch (value) {
                case (#description) "description";
                case (#id) "id";
                case (#name) "name";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetSpacesByIdsTopicFieldsParameterInner =
            switch (json) {
                case "description" ?#description;
                case "id" ?#id;
                case "name" ?#name;
                case _ null;
            };
    }
}
