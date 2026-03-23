
// SearchCommunityNotesWrittenNoteFieldsParameterInner.mo
/// Enum values: #id, #info, #status, #test_result

module {
    // User-facing type: type-safe variants for application code
    public type SearchCommunityNotesWrittenNoteFieldsParameterInner = {
        #id;
        #info;
        #status;
        #test_result;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SearchCommunityNotesWrittenNoteFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SearchCommunityNotesWrittenNoteFieldsParameterInner) : JSON =
            switch (value) {
                case (#id) "id";
                case (#info) "info";
                case (#status) "status";
                case (#test_result) "test_result";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SearchCommunityNotesWrittenNoteFieldsParameterInner =
            switch (json) {
                case "id" ?#id;
                case "info" ?#info;
                case "status" ?#status;
                case "test_result" ?#test_result;
                case _ null;
            };
    }
}
