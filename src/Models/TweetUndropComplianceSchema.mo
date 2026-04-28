
import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetUndropComplianceSchema.mo

module {
    public type TweetUndropComplianceSchema = {
        undrop : TweetComplianceSchema;
    };

    public module JSON {
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
