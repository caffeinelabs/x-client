
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2ChatConversationsIdResponseMeta; JSON = Get2ChatConversationsIdResponseMeta } "./Get2ChatConversationsIdResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type Tweet; JSON = Tweet } "./Tweet";

// Get2TweetsIdQuoteTweetsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2TweetsIdQuoteTweetsResponse = {
        data : ?[Tweet];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2ChatConversationsIdResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2TweetsIdQuoteTweetsResponse type
        public type JSON = {
            data : ?[Tweet];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2ChatConversationsIdResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2TweetsIdQuoteTweetsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2TweetsIdQuoteTweetsResponse = ?json;
    }
}
