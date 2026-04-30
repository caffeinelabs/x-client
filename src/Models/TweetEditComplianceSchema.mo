
import { type TweetEditComplianceObjectSchema; JSON = TweetEditComplianceObjectSchema } "./TweetEditComplianceObjectSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetEditComplianceSchema.mo

module {
    public type TweetEditComplianceSchema = {
        tweet_edit : TweetEditComplianceObjectSchema;
    };

    public module JSON {
        // `init` constructs a TweetEditComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetEditComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            tweet_edit : TweetEditComplianceObjectSchema;
        }) : TweetEditComplianceSchema {
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
};
