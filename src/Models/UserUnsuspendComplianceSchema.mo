
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserUnsuspendComplianceSchema.mo

module {
    public type UserUnsuspendComplianceSchema = {
        user_unsuspend : UserComplianceSchema;
    };

    public module JSON {
        public func toCandidValue(value : UserUnsuspendComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_unsuspend", UserComplianceSchema.toCandidValue(value.user_unsuspend)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserUnsuspendComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_unsuspend_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_unsuspend") else return null;
                    let ?user_unsuspend = (UserComplianceSchema.fromCandidValue(user_unsuspend_field.1)) else return null;
                    ?{
                        user_unsuspend;
                    };
                };
                case _ null;
            };
    };
};
