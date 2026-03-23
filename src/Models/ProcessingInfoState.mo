
// ProcessingInfoState.mo
/// State of upload
/// Enum values: #succeeded, #in_progress, #pending, #failed

module {
    // User-facing type: type-safe variants for application code
    public type ProcessingInfoState = {
        #succeeded;
        #in_progress;
        #pending;
        #failed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ProcessingInfoState type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ProcessingInfoState) : JSON =
            switch (value) {
                case (#succeeded) "succeeded";
                case (#in_progress) "in_progress";
                case (#pending) "pending";
                case (#failed) "failed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ProcessingInfoState =
            switch (json) {
                case "succeeded" ?#succeeded;
                case "in_progress" ?#in_progress;
                case "pending" ?#pending;
                case "failed" ?#failed;
                case _ null;
            };
    }
}
