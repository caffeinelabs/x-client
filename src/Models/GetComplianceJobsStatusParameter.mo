
// GetComplianceJobsStatusParameter.mo
/// Enum values: #created, #in_progress, #failed, #complete

module {
    // User-facing type: type-safe variants for application code
    public type GetComplianceJobsStatusParameter = {
        #created;
        #in_progress;
        #failed;
        #complete;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetComplianceJobsStatusParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetComplianceJobsStatusParameter) : JSON =
            switch (value) {
                case (#created) "created";
                case (#in_progress) "in_progress";
                case (#failed) "failed";
                case (#complete) "complete";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetComplianceJobsStatusParameter =
            switch (json) {
                case "created" ?#created;
                case "in_progress" ?#in_progress;
                case "failed" ?#failed;
                case "complete" ?#complete;
                case _ null;
            };
    }
}
