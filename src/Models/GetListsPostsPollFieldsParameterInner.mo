
// GetListsPostsPollFieldsParameterInner.mo
/// Enum values: #duration_minutes, #end_datetime, #id, #options, #voting_status

module {
    // User-facing type: type-safe variants for application code
    public type GetListsPostsPollFieldsParameterInner = {
        #duration_minutes;
        #end_datetime;
        #id;
        #options;
        #voting_status;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetListsPostsPollFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetListsPostsPollFieldsParameterInner) : JSON =
            switch (value) {
                case (#duration_minutes) "duration_minutes";
                case (#end_datetime) "end_datetime";
                case (#id) "id";
                case (#options) "options";
                case (#voting_status) "voting_status";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetListsPostsPollFieldsParameterInner =
            switch (json) {
                case "duration_minutes" ?#duration_minutes;
                case "end_datetime" ?#end_datetime;
                case "id" ?#id;
                case "options" ?#options;
                case "voting_status" ?#voting_status;
                case _ null;
            };
    }
}
