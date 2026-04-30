
import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetUndropComplianceSchema.mo

module {
    public type TweetUndropComplianceSchema = {
        undrop : TweetComplianceSchema;
    };

    public module JSON {
        // `init` constructs a TweetUndropComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetUndropComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            undrop : TweetComplianceSchema;
        }) : TweetUndropComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?TweetUndropComplianceSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetUndropComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("undrop", TweetComplianceSchema.toCandidValue(value.undrop)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetUndropComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?undrop_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "undrop") else return null;
                    let ?undrop = (TweetComplianceSchema.fromCandidValue(undrop_field.1)) else return null;
                    ?{
                        undrop;
                    };
                };
                case _ null;
            };
    };
};
