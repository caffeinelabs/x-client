
import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetDeleteComplianceSchema.mo

module {
    public type TweetDeleteComplianceSchema = {
        delete : TweetComplianceSchema;
    };

    public module JSON {
        public func toCandidValue(value : TweetDeleteComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("delete", TweetComplianceSchema.toCandidValue(value.delete)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetDeleteComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?delete_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "delete") else return null;
                    let ?delete = (TweetComplianceSchema.fromCandidValue(delete_field.1)) else return null;
                    ?{
                        delete;
                    };
                };
                case _ null;
            };
    };
};
