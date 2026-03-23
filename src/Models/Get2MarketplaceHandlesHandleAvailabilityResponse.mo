
import { type MarketplaceHandleAvailability; JSON = MarketplaceHandleAvailability } "./MarketplaceHandleAvailability";

import { type Problem; JSON = Problem } "./Problem";

// Get2MarketplaceHandlesHandleAvailabilityResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2MarketplaceHandlesHandleAvailabilityResponse = {
        data : ?MarketplaceHandleAvailability;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2MarketplaceHandlesHandleAvailabilityResponse type
        public type JSON = {
            data : ?MarketplaceHandleAvailability;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2MarketplaceHandlesHandleAvailabilityResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2MarketplaceHandlesHandleAvailabilityResponse = ?json;
    }
}
