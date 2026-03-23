
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2UsersIdMentionsResponseMeta; JSON = Get2UsersIdMentionsResponseMeta } "./Get2UsersIdMentionsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type Tweet; JSON = Tweet } "./Tweet";

// Get2UsersIdTimelinesReverseChronologicalResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersIdTimelinesReverseChronologicalResponse = {
        data : ?[Tweet];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2UsersIdMentionsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersIdTimelinesReverseChronologicalResponse type
        public type JSON = {
            data : ?[Tweet];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2UsersIdMentionsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersIdTimelinesReverseChronologicalResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersIdTimelinesReverseChronologicalResponse = ?json;
    }
}
