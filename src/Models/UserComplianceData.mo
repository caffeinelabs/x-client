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
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserComplianceData.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
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

        public func toCandidValue(value : UserComplianceData) : Candid.Candid =
            switch (value) {
                case (#UserProtectComplianceSchema(v)) #Variant(("UserProtectComplianceSchema", UserProtectComplianceSchema.toCandidValue(v)));
                case (#UserUnprotectComplianceSchema(v)) #Variant(("UserUnprotectComplianceSchema", UserUnprotectComplianceSchema.toCandidValue(v)));
                case (#UserDeleteComplianceSchema(v)) #Variant(("UserDeleteComplianceSchema", UserDeleteComplianceSchema.toCandidValue(v)));
                case (#UserUndeleteComplianceSchema(v)) #Variant(("UserUndeleteComplianceSchema", UserUndeleteComplianceSchema.toCandidValue(v)));
                case (#UserSuspendComplianceSchema(v)) #Variant(("UserSuspendComplianceSchema", UserSuspendComplianceSchema.toCandidValue(v)));
                case (#UserUnsuspendComplianceSchema(v)) #Variant(("UserUnsuspendComplianceSchema", UserUnsuspendComplianceSchema.toCandidValue(v)));
                case (#UserWithheldComplianceSchema(v)) #Variant(("UserWithheldComplianceSchema", UserWithheldComplianceSchema.toCandidValue(v)));
                case (#UserScrubGeoSchema(v)) #Variant(("UserScrubGeoSchema", UserScrubGeoSchema.toCandidValue(v)));
                case (#UserProfileModificationComplianceSchema(v)) #Variant(("UserProfileModificationComplianceSchema", UserProfileModificationComplianceSchema.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?UserComplianceData =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("UserProtectComplianceSchema") {
                            let ?inner = UserProtectComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserProtectComplianceSchema(inner)
                        };
                        case ("UserUnprotectComplianceSchema") {
                            let ?inner = UserUnprotectComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserUnprotectComplianceSchema(inner)
                        };
                        case ("UserDeleteComplianceSchema") {
                            let ?inner = UserDeleteComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserDeleteComplianceSchema(inner)
                        };
                        case ("UserUndeleteComplianceSchema") {
                            let ?inner = UserUndeleteComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserUndeleteComplianceSchema(inner)
                        };
                        case ("UserSuspendComplianceSchema") {
                            let ?inner = UserSuspendComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserSuspendComplianceSchema(inner)
                        };
                        case ("UserUnsuspendComplianceSchema") {
                            let ?inner = UserUnsuspendComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserUnsuspendComplianceSchema(inner)
                        };
                        case ("UserWithheldComplianceSchema") {
                            let ?inner = UserWithheldComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserWithheldComplianceSchema(inner)
                        };
                        case ("UserScrubGeoSchema") {
                            let ?inner = UserScrubGeoSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserScrubGeoSchema(inner)
                        };
                        case ("UserProfileModificationComplianceSchema") {
                            let ?inner = UserProfileModificationComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserProfileModificationComplianceSchema(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
