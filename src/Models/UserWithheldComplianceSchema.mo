
import { type UserTakedownComplianceSchema; JSON = UserTakedownComplianceSchema } "./UserTakedownComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserWithheldComplianceSchema.mo

module {
    public type UserWithheldComplianceSchema = {
        user_withheld : UserTakedownComplianceSchema;
    };

    public module JSON {
        public func toCandidValue(value : UserWithheldComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_withheld", UserTakedownComplianceSchema.toCandidValue(value.user_withheld)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserWithheldComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_withheld_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_withheld") else return null;
                    let ?user_withheld = (UserTakedownComplianceSchema.fromCandidValue(user_withheld_field.1)) else return null;
                    ?{
                        user_withheld;
                    };
                };
                case _ null;
            };
    };
};
