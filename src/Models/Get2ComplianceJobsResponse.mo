
import { type ComplianceJob; JSON = ComplianceJob } "./ComplianceJob";

import { type Get2ComplianceJobsResponseMeta; JSON = Get2ComplianceJobsResponseMeta } "./Get2ComplianceJobsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

// Get2ComplianceJobsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2ComplianceJobsResponse = {
        data : ?[ComplianceJob];
        errors : ?[Problem];
        meta : ?Get2ComplianceJobsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2ComplianceJobsResponse type
        public type JSON = {
            data : ?[ComplianceJob];
            errors : ?[Problem];
            meta : ?Get2ComplianceJobsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2ComplianceJobsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2ComplianceJobsResponse = ?json;
    }
}
