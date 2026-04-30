
import { type TweetNotice; JSON = TweetNotice } "./TweetNotice";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetNoticeSchema.mo

module {
    /// The required-fields slice of TweetNoticeSchema — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        public_tweet_notice : TweetNotice;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetNoticeSchema as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type TweetNoticeSchema = Required and Optional;

    public module JSON {
        // `init` constructs a TweetNoticeSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetNoticeSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetNoticeSchema {
            let ?res = from_candid(to_candid(required)) : ?TweetNoticeSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetNoticeSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("public_tweet_notice", TweetNotice.toCandidValue(value.public_tweet_notice)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetNoticeSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?public_tweet_notice_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_tweet_notice") else return null;
                    let ?public_tweet_notice = (TweetNotice.fromCandidValue(public_tweet_notice_field.1)) else return null;
                    ?{
                        public_tweet_notice;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
