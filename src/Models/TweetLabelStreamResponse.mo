/// Tweet label stream events.

import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";

import { type TweetLabelData; JSON = TweetLabelData } "./TweetLabelData";

import { type TweetLabelStreamResponseOneOf; JSON = TweetLabelStreamResponseOneOf } "./TweetLabelStreamResponseOneOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetLabelStreamResponse.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type TweetLabelStreamResponse = {
        #TweetLabelStreamResponseOneOf : TweetLabelStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    public module JSON {
        // Generic oneOf is rare on the surfaces we care about (chat / tweet
        // bodies use discriminator-oneOf or string-flatten). The branches here
        // can mix primitives, parametrised types, and arrays — none of which
        // dispatch cleanly via `OneOf&lt;TweetLabelStreamResponseOneOf,LikesComplianceStreamResponseOneOf1&gt;.toCandidValue(v)` (Text isn't a
        // module; `Map<K,V>` and `[[Int]]` aren't dottable identifiers). To
        // keep the file type-checking (so `mops publish` can extract docs),
        // stub all three converters with `Runtime.unreachable()`. Real
        // implementations are a follow-up — primitive dispatch + recursive
        // partial reuse for arrays/maps inside oneOf branches.
        public func toText(_value : TweetLabelStreamResponse) : Text = Runtime.unreachable();

        public func toCandidValue(_value : TweetLabelStreamResponse) : Candid.Candid = Runtime.unreachable();

        public func fromCandidValue(_candid : Candid.Candid) : ?TweetLabelStreamResponse = Runtime.unreachable();
    };
};
