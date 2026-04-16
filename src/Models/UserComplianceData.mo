/// User compliance data.

import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";

import { type UserDeleteComplianceSchema; JSON = UserDeleteComplianceSchema } "./UserDeleteComplianceSchema";

import { type UserProfileModificationComplianceSchema; JSON = UserProfileModificationComplianceSchema } "./UserProfileModificationComplianceSchema";

import { type UserProfileModificationObjectSchema; JSON = UserProfileModificationObjectSchema } "./UserProfileModificationObjectSchema";

import { type UserProtectComplianceSchema; JSON = UserProtectComplianceSchema } "./UserProtectComplianceSchema";

import { type UserScrubGeoObjectSchema; JSON = UserScrubGeoObjectSchema } "./UserScrubGeoObjectSchema";

import { type UserScrubGeoSchema; JSON = UserScrubGeoSchema } "./UserScrubGeoSchema";

import { type UserSuspendComplianceSchema; JSON = UserSuspendComplianceSchema } "./UserSuspendComplianceSchema";

import { type UserTakedownComplianceSchema; JSON = UserTakedownComplianceSchema } "./UserTakedownComplianceSchema";

import { type UserUndeleteComplianceSchema; JSON = UserUndeleteComplianceSchema } "./UserUndeleteComplianceSchema";

import { type UserUnprotectComplianceSchema; JSON = UserUnprotectComplianceSchema } "./UserUnprotectComplianceSchema";

import { type UserUnsuspendComplianceSchema; JSON = UserUnsuspendComplianceSchema } "./UserUnsuspendComplianceSchema";

import { type UserWithheldComplianceSchema; JSON = UserWithheldComplianceSchema } "./UserWithheldComplianceSchema";

// UserComplianceData.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type UserComplianceData = {
        #UserProtectComplianceSchema : UserProtectComplianceSchema;
        #UserUnprotectComplianceSchema : UserUnprotectComplianceSchema;
        #UserDeleteComplianceSchema : UserDeleteComplianceSchema;
        #UserUndeleteComplianceSchema : UserUndeleteComplianceSchema;
        #UserSuspendComplianceSchema : UserSuspendComplianceSchema;
        #UserUnsuspendComplianceSchema : UserUnsuspendComplianceSchema;
        #UserWithheldComplianceSchema : UserWithheldComplianceSchema;
        #UserScrubGeoSchema : UserScrubGeoSchema;
        #UserProfileModificationComplianceSchema : UserProfileModificationComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : UserComplianceData) : Text =
            switch (value) {
                case (#UserProtectComplianceSchema(v)) Runtime.unreachable();
                case (#UserUnprotectComplianceSchema(v)) Runtime.unreachable();
                case (#UserDeleteComplianceSchema(v)) Runtime.unreachable();
                case (#UserUndeleteComplianceSchema(v)) Runtime.unreachable();
                case (#UserSuspendComplianceSchema(v)) Runtime.unreachable();
                case (#UserUnsuspendComplianceSchema(v)) Runtime.unreachable();
                case (#UserWithheldComplianceSchema(v)) Runtime.unreachable();
                case (#UserScrubGeoSchema(v)) Runtime.unreachable();
                case (#UserProfileModificationComplianceSchema(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserComplianceData type
        public type JSON = {
            #UserProtectComplianceSchema : UserProtectComplianceSchema;
            #UserUnprotectComplianceSchema : UserUnprotectComplianceSchema;
            #UserDeleteComplianceSchema : UserDeleteComplianceSchema;
            #UserUndeleteComplianceSchema : UserUndeleteComplianceSchema;
            #UserSuspendComplianceSchema : UserSuspendComplianceSchema;
            #UserUnsuspendComplianceSchema : UserUnsuspendComplianceSchema;
            #UserWithheldComplianceSchema : UserWithheldComplianceSchema;
            #UserScrubGeoSchema : UserScrubGeoSchema;
            #UserProfileModificationComplianceSchema : UserProfileModificationComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserComplianceData) : JSON =
            switch (value) {
                case (#UserProtectComplianceSchema(v)) #UserProtectComplianceSchema(v);
                case (#UserUnprotectComplianceSchema(v)) #UserUnprotectComplianceSchema(v);
                case (#UserDeleteComplianceSchema(v)) #UserDeleteComplianceSchema(v);
                case (#UserUndeleteComplianceSchema(v)) #UserUndeleteComplianceSchema(v);
                case (#UserSuspendComplianceSchema(v)) #UserSuspendComplianceSchema(v);
                case (#UserUnsuspendComplianceSchema(v)) #UserUnsuspendComplianceSchema(v);
                case (#UserWithheldComplianceSchema(v)) #UserWithheldComplianceSchema(v);
                case (#UserScrubGeoSchema(v)) #UserScrubGeoSchema(v);
                case (#UserProfileModificationComplianceSchema(v)) #UserProfileModificationComplianceSchema(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserComplianceData =
            switch (json) {
                case (#UserProtectComplianceSchema(v)) ?#UserProtectComplianceSchema(v);
                case (#UserUnprotectComplianceSchema(v)) ?#UserUnprotectComplianceSchema(v);
                case (#UserDeleteComplianceSchema(v)) ?#UserDeleteComplianceSchema(v);
                case (#UserUndeleteComplianceSchema(v)) ?#UserUndeleteComplianceSchema(v);
                case (#UserSuspendComplianceSchema(v)) ?#UserSuspendComplianceSchema(v);
                case (#UserUnsuspendComplianceSchema(v)) ?#UserUnsuspendComplianceSchema(v);
                case (#UserWithheldComplianceSchema(v)) ?#UserWithheldComplianceSchema(v);
                case (#UserScrubGeoSchema(v)) ?#UserScrubGeoSchema(v);
                case (#UserProfileModificationComplianceSchema(v)) ?#UserProfileModificationComplianceSchema(v);
            };
    }
}
