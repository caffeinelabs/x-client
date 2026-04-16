/// An Engagement Api Response.

import { type EngagementErrorsInner; JSON = EngagementErrorsInner } "./EngagementErrorsInner";

import { type EngagementMeasurement; JSON = EngagementMeasurement } "./EngagementMeasurement";

// Engagement.mo

module {
    // User-facing type: what application code uses
    public type Engagement = {
        errors : ?[EngagementErrorsInner];
        measurement : ?EngagementMeasurement;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Engagement type
        public type JSON = {
            errors : ?[EngagementErrorsInner];
            measurement : ?EngagementMeasurement;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Engagement) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Engagement = ?json;
    }
}
