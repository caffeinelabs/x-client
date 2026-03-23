
// SearchCommunitiesCommunityFieldsParameterInner.mo
/// Enum values: #access, #created_at, #description, #id, #join_policy, #member_count, #name

module {
    // User-facing type: type-safe variants for application code
    public type SearchCommunitiesCommunityFieldsParameterInner = {
        #access;
        #created_at;
        #description;
        #id;
        #join_policy;
        #member_count;
        #name;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SearchCommunitiesCommunityFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SearchCommunitiesCommunityFieldsParameterInner) : JSON =
            switch (value) {
                case (#access) "access";
                case (#created_at) "created_at";
                case (#description) "description";
                case (#id) "id";
                case (#join_policy) "join_policy";
                case (#member_count) "member_count";
                case (#name) "name";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SearchCommunitiesCommunityFieldsParameterInner =
            switch (json) {
                case "access" ?#access;
                case "created_at" ?#created_at;
                case "description" ?#description;
                case "id" ?#id;
                case "join_policy" ?#join_policy;
                case "member_count" ?#member_count;
                case "name" ?#name;
                case _ null;
            };
    }
}
