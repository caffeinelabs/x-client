
import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetDropComplianceSchema.mo

module {
    public type TweetDropComplianceSchema = {
        drop : TweetComplianceSchema;
    };

    public module JSON {
        // `init` constructs a TweetDropComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetDropComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            drop : TweetComplianceSchema;
        }) : TweetDropComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?TweetDropComplianceSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetDropComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("drop", TweetComplianceSchema.toCandidValue(value.drop)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetDropComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?drop_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "drop") else return null;
                    let ?drop = (TweetComplianceSchema.fromCandidValue(drop_field.1)) else return null;
                    ?{
                        drop;
                    };
                };
                case _ null;
            };
    };
};
