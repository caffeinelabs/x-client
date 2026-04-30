
import { type TweetEditComplianceObjectSchema; JSON = TweetEditComplianceObjectSchema } "./TweetEditComplianceObjectSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetEditComplianceSchema.mo

module {
    /// The required-fields slice of TweetEditComplianceSchema — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        tweet_edit : TweetEditComplianceObjectSchema;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetEditComplianceSchema as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type TweetEditComplianceSchema = Required and Optional;

    public module JSON {
        // `init` constructs a TweetEditComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetEditComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetEditComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?TweetEditComplianceSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetEditComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("tweet_edit", TweetEditComplianceObjectSchema.toCandidValue(value.tweet_edit)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetEditComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?tweet_edit_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_edit") else return null;
                    let ?tweet_edit = (TweetEditComplianceObjectSchema.fromCandidValue(tweet_edit_field.1)) else return null;
                    ?{
                        tweet_edit;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
