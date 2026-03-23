
import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";

import { type TweetDeleteComplianceSchema; JSON = TweetDeleteComplianceSchema } "./TweetDeleteComplianceSchema";

import { type TweetDropComplianceSchema; JSON = TweetDropComplianceSchema } "./TweetDropComplianceSchema";

import { type TweetEditComplianceObjectSchema; JSON = TweetEditComplianceObjectSchema } "./TweetEditComplianceObjectSchema";

import { type TweetEditComplianceSchema; JSON = TweetEditComplianceSchema } "./TweetEditComplianceSchema";

import { type TweetTakedownComplianceSchema; JSON = TweetTakedownComplianceSchema } "./TweetTakedownComplianceSchema";

import { type TweetUndropComplianceSchema; JSON = TweetUndropComplianceSchema } "./TweetUndropComplianceSchema";

import { type TweetWithheldComplianceSchema; JSON = TweetWithheldComplianceSchema } "./TweetWithheldComplianceSchema";

// TweetComplianceData.mo
/// Tweet compliance data.
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type TweetComplianceData = {
        #TweetDeleteComplianceSchema : TweetDeleteComplianceSchema;
        #TweetWithheldComplianceSchema : TweetWithheldComplianceSchema;
        #TweetDropComplianceSchema : TweetDropComplianceSchema;
        #TweetUndropComplianceSchema : TweetUndropComplianceSchema;
        #TweetEditComplianceSchema : TweetEditComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : TweetComplianceData) : Text =
            switch (value) {
                case (#TweetDeleteComplianceSchema(v)) Runtime.unreachable();
                case (#TweetWithheldComplianceSchema(v)) Runtime.unreachable();
                case (#TweetDropComplianceSchema(v)) Runtime.unreachable();
                case (#TweetUndropComplianceSchema(v)) Runtime.unreachable();
                case (#TweetEditComplianceSchema(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetComplianceData type
        public type JSON = {
            #TweetDeleteComplianceSchema : TweetDeleteComplianceSchema;
            #TweetWithheldComplianceSchema : TweetWithheldComplianceSchema;
            #TweetDropComplianceSchema : TweetDropComplianceSchema;
            #TweetUndropComplianceSchema : TweetUndropComplianceSchema;
            #TweetEditComplianceSchema : TweetEditComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetComplianceData) : JSON =
            switch (value) {
                case (#TweetDeleteComplianceSchema(v)) #TweetDeleteComplianceSchema(v);
                case (#TweetWithheldComplianceSchema(v)) #TweetWithheldComplianceSchema(v);
                case (#TweetDropComplianceSchema(v)) #TweetDropComplianceSchema(v);
                case (#TweetUndropComplianceSchema(v)) #TweetUndropComplianceSchema(v);
                case (#TweetEditComplianceSchema(v)) #TweetEditComplianceSchema(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetComplianceData =
            switch (json) {
                case (#TweetDeleteComplianceSchema(v)) ?#TweetDeleteComplianceSchema(v);
                case (#TweetWithheldComplianceSchema(v)) ?#TweetWithheldComplianceSchema(v);
                case (#TweetDropComplianceSchema(v)) ?#TweetDropComplianceSchema(v);
                case (#TweetUndropComplianceSchema(v)) ?#TweetUndropComplianceSchema(v);
                case (#TweetEditComplianceSchema(v)) ?#TweetEditComplianceSchema(v);
            };
    }
}
