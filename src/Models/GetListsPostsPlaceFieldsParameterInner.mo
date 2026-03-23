
// GetListsPostsPlaceFieldsParameterInner.mo
/// Enum values: #contained_within, #country, #country_code, #full_name, #geo, #id, #name, #place_type

module {
    // User-facing type: type-safe variants for application code
    public type GetListsPostsPlaceFieldsParameterInner = {
        #contained_within;
        #country;
        #country_code;
        #full_name;
        #geo;
        #id;
        #name;
        #place_type;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetListsPostsPlaceFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetListsPostsPlaceFieldsParameterInner) : JSON =
            switch (value) {
                case (#contained_within) "contained_within";
                case (#country) "country";
                case (#country_code) "country_code";
                case (#full_name) "full_name";
                case (#geo) "geo";
                case (#id) "id";
                case (#name) "name";
                case (#place_type) "place_type";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetListsPostsPlaceFieldsParameterInner =
            switch (json) {
                case "contained_within" ?#contained_within;
                case "country" ?#country;
                case "country_code" ?#country_code;
                case "full_name" ?#full_name;
                case "geo" ?#geo;
                case "id" ?#id;
                case "name" ?#name;
                case "place_type" ?#place_type;
                case _ null;
            };
    }
}
