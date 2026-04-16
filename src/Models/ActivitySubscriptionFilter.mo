/// An XAA subscription filter.

import { type ActivitySubscriptionFilterDirection; JSON = ActivitySubscriptionFilterDirection } "./ActivitySubscriptionFilterDirection";

// ActivitySubscriptionFilter.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionFilter = {
        direction : ?ActivitySubscriptionFilterDirection;
        /// A keyword to filter on.
        keyword : ?Text;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        user_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionFilter type
        public type JSON = {
            direction : ?ActivitySubscriptionFilterDirection.JSON;
            keyword : ?Text;
            user_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionFilter) : JSON = { value with
            direction = do ? { ActivitySubscriptionFilterDirection.toJSON(value.direction!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionFilter {
            ?{ json with
                direction = do ? { ActivitySubscriptionFilterDirection.fromJSON(json.direction!)! };
            }
        };
    }
}
