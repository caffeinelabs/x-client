
import { type Get2ComplianceJobsResponseMeta; JSON = Get2ComplianceJobsResponseMeta } "./Get2ComplianceJobsResponseMeta";

import { type News; JSON = News } "./News";

import { type Problem; JSON = Problem } "./Problem";

// Get2NewsSearchResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2NewsSearchResponse = {
        data : ?[News];
        errors : ?[Problem];
        meta : ?Get2ComplianceJobsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2NewsSearchResponse type
        public type JSON = {
            data : ?[News];
            errors : ?[Problem];
            meta : ?Get2ComplianceJobsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2NewsSearchResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2NewsSearchResponse = ?json;
    }
}
