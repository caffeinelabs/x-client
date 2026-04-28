
import { type TweetTakedownComplianceSchema; JSON = TweetTakedownComplianceSchema } "./TweetTakedownComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetWithheldComplianceSchema.mo

module {
    public type TweetWithheldComplianceSchema = {
        withheld : TweetTakedownComplianceSchema;
    };

    public module JSON {
        public func toCandidValue(value : TweetWithheldComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("withheld", TweetTakedownComplianceSchema.toCandidValue(value.withheld)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetWithheldComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?withheld_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "withheld") else return null;
                    let ?withheld = (TweetTakedownComplianceSchema.fromCandidValue(withheld_field.1)) else return null;
                    ?{
                        withheld;
                    };
                };
                case _ null;
            };
    };
};
