
import { type ActivitySubscription; JSON = ActivitySubscription } "./ActivitySubscription";

import { type ActivitySubscriptionGetResponseMeta; JSON = ActivitySubscriptionGetResponseMeta } "./ActivitySubscriptionGetResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

// ActivitySubscriptionGetResponse.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionGetResponse = {
        data : ?[ActivitySubscription];
        errors : ?[Problem];
        meta : ?ActivitySubscriptionGetResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionGetResponse type
        public type JSON = {
            data : ?[ActivitySubscription];
            errors : ?[Problem];
            meta : ?ActivitySubscriptionGetResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionGetResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionGetResponse = ?json;
    }
}
