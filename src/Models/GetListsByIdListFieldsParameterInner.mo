
// GetListsByIdListFieldsParameterInner.mo
/// Enum values: #created_at, #description, #follower_count, #id, #member_count, #name, #owner_id, #private_

module {
    // User-facing type: type-safe variants for application code
    public type GetListsByIdListFieldsParameterInner = {
        #created_at;
        #description;
        #follower_count;
        #id;
        #member_count;
        #name;
        #owner_id;
        #private_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetListsByIdListFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetListsByIdListFieldsParameterInner) : JSON =
            switch (value) {
                case (#created_at) "created_at";
                case (#description) "description";
                case (#follower_count) "follower_count";
                case (#id) "id";
                case (#member_count) "member_count";
                case (#name) "name";
                case (#owner_id) "owner_id";
                case (#private_) "private";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetListsByIdListFieldsParameterInner =
            switch (json) {
                case "created_at" ?#created_at;
                case "description" ?#description;
                case "follower_count" ?#follower_count;
                case "id" ?#id;
                case "member_count" ?#member_count;
                case "name" ?#name;
                case "owner_id" ?#owner_id;
                case "private" ?#private_;
                case _ null;
            };
    }
}
