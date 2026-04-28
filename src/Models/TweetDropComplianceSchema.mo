
import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetDropComplianceSchema.mo

module {
    public type TweetDropComplianceSchema = {
        drop : TweetComplianceSchema;
    };

    public module JSON {
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
