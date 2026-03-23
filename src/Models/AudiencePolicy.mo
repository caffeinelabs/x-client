
import { type AudiencePolicyCreatorSubscriptionsInner; JSON = AudiencePolicyCreatorSubscriptionsInner } "./AudiencePolicyCreatorSubscriptionsInner";

// AudiencePolicy.mo

module {
    // User-facing type: what application code uses
    public type AudiencePolicy = {
        creator_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner];
        x_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AudiencePolicy type
        public type JSON = {
            creator_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner];
            x_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AudiencePolicy) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AudiencePolicy = ?json;
    }
}
