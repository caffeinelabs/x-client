/// Tweet compliance data.

import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";

import { type TweetDeleteComplianceSchema; JSON = TweetDeleteComplianceSchema } "./TweetDeleteComplianceSchema";

import { type TweetDropComplianceSchema; JSON = TweetDropComplianceSchema } "./TweetDropComplianceSchema";

import { type TweetEditComplianceObjectSchema; JSON = TweetEditComplianceObjectSchema } "./TweetEditComplianceObjectSchema";

import { type TweetEditComplianceSchema; JSON = TweetEditComplianceSchema } "./TweetEditComplianceSchema";

import { type TweetTakedownComplianceSchema; JSON = TweetTakedownComplianceSchema } "./TweetTakedownComplianceSchema";

import { type TweetUndropComplianceSchema; JSON = TweetUndropComplianceSchema } "./TweetUndropComplianceSchema";

import { type TweetWithheldComplianceSchema; JSON = TweetWithheldComplianceSchema } "./TweetWithheldComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetComplianceData.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type TweetComplianceData = {
        #TweetDeleteComplianceSchema : TweetDeleteComplianceSchema;
        #TweetWithheldComplianceSchema : TweetWithheldComplianceSchema;
        #TweetDropComplianceSchema : TweetDropComplianceSchema;
        #TweetUndropComplianceSchema : TweetUndropComplianceSchema;
        #TweetEditComplianceSchema : TweetEditComplianceSchema;
    };

    public module JSON {
        // Generic oneOf is rare on the surfaces we care about (chat / tweet
        // bodies use discriminator-oneOf or string-flatten). The branches here
        // can mix primitives, parametrised types, and arrays — none of which
        // dispatch cleanly via `OneOf&lt;TweetDeleteComplianceSchema,TweetWithheldComplianceSchema,TweetDropComplianceSchema,TweetUndropComplianceSchema,TweetEditComplianceSchema&gt;.toCandidValue(v)` (Text isn't a
        // module; `Map<K,V>` and `[[Int]]` aren't dottable identifiers). To
        // keep the file type-checking (so `mops publish` can extract docs),
        // stub all three converters with `Runtime.unreachable()`. Real
        // implementations are a follow-up — primitive dispatch + recursive
        // partial reuse for arrays/maps inside oneOf branches.
        public func toText(_value : TweetComplianceData) : Text = Runtime.unreachable();

        public func toCandidValue(_value : TweetComplianceData) : Candid.Candid = Runtime.unreachable();

        public func fromCandidValue(_candid : Candid.Candid) : ?TweetComplianceData = Runtime.unreachable();
    };
};
