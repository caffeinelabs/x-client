
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserUnprotectComplianceSchema.mo

module {
    public type UserUnprotectComplianceSchema = {
        user_unprotect : UserComplianceSchema;
    };

    public module JSON {
        public func toCandidValue(value : UserUnprotectComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_unprotect", UserComplianceSchema.toCandidValue(value.user_unprotect)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserUnprotectComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_unprotect_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_unprotect") else return null;
                    let ?user_unprotect = (UserComplianceSchema.fromCandidValue(user_unprotect_field.1)) else return null;
                    ?{
                        user_unprotect;
                    };
                };
                case _ null;
            };
    };
};
