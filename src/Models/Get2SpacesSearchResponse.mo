
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2ComplianceJobsResponseMeta; JSON = Get2ComplianceJobsResponseMeta } "./Get2ComplianceJobsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type Space; JSON = Space } "./Space";

// Get2SpacesSearchResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2SpacesSearchResponse = {
        data : ?[Space];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2ComplianceJobsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2SpacesSearchResponse type
        public type JSON = {
            data : ?[Space];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2ComplianceJobsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2SpacesSearchResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2SpacesSearchResponse = ?json;
    }
}
