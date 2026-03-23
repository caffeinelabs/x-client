
import { type ComplianceJob; JSON = ComplianceJob } "./ComplianceJob";

import { type Problem; JSON = Problem } "./Problem";

// Get2ComplianceJobsIdResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2ComplianceJobsIdResponse = {
        data : ?ComplianceJob;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2ComplianceJobsIdResponse type
        public type JSON = {
            data : ?ComplianceJob.JSON;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2ComplianceJobsIdResponse) : JSON = { value with
            data = do ? { ComplianceJob.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2ComplianceJobsIdResponse {
            ?{ json with
                data = do ? { ComplianceJob.fromJSON(json.data!)! };
            }
        };
    }
}
