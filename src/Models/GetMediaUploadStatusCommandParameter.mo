
// GetMediaUploadStatusCommandParameter.mo
/// Enum values: #status

module {
    // User-facing type: type-safe variants for application code
    public type GetMediaUploadStatusCommandParameter = {
        #status;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetMediaUploadStatusCommandParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetMediaUploadStatusCommandParameter) : JSON =
            switch (value) {
                case (#status) "STATUS";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetMediaUploadStatusCommandParameter =
            switch (json) {
                case "STATUS" ?#status;
                case _ null;
            };
    }
}
