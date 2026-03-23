
// ComplianceJobStatus.mo
/// Status of a compliance job.
/// Enum values: #created, #in_progress, #failed, #complete, #expired

module {
    // User-facing type: type-safe variants for application code
    public type ComplianceJobStatus = {
        #created;
        #in_progress;
        #failed;
        #complete;
        #expired;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ComplianceJobStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ComplianceJobStatus) : JSON =
            switch (value) {
                case (#created) "created";
                case (#in_progress) "in_progress";
                case (#failed) "failed";
                case (#complete) "complete";
                case (#expired) "expired";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ComplianceJobStatus =
            switch (json) {
                case "created" ?#created;
                case "in_progress" ?#in_progress;
                case "failed" ?#failed;
                case "complete" ?#complete;
                case "expired" ?#expired;
                case _ null;
            };
    }
}
