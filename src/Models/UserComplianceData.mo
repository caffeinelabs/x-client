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
import Runtime "mo:core/Runtime";

// UserComplianceData.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

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
        // Generic oneOf is rare on the surfaces we care about (chat / tweet
        // bodies use discriminator-oneOf or string-flatten). The branches here
        // can mix primitives, parametrised types, and arrays — none of which
        // dispatch cleanly via `OneOf&lt;UserProtectComplianceSchema,UserUnprotectComplianceSchema,UserDeleteComplianceSchema,UserUndeleteComplianceSchema,UserSuspendComplianceSchema,UserUnsuspendComplianceSchema,UserWithheldComplianceSchema,UserScrubGeoSchema,UserProfileModificationComplianceSchema&gt;.toCandidValue(v)` (Text isn't a
        // module; `Map<K,V>` and `[[Int]]` aren't dottable identifiers). To
        // keep the file type-checking (so `mops publish` can extract docs),
        // stub all three converters with `Runtime.unreachable()`. Real
        // implementations are a follow-up — primitive dispatch + recursive
        // partial reuse for arrays/maps inside oneOf branches.
        public func toText(_value : UserComplianceData) : Text = Runtime.unreachable();

        public func toCandidValue(_value : UserComplianceData) : Candid.Candid = Runtime.unreachable();

        public func fromCandidValue(_candid : Candid.Candid) : ?UserComplianceData = Runtime.unreachable();
    };
};
