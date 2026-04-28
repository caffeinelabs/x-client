
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserSuspendComplianceSchema.mo

module {
    public type UserSuspendComplianceSchema = {
        user_suspend : UserComplianceSchema;
    };

    public module JSON {
        public func toCandidValue(value : UserSuspendComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_suspend", UserComplianceSchema.toCandidValue(value.user_suspend)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserSuspendComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_suspend_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_suspend") else return null;
                    let ?user_suspend = (UserComplianceSchema.fromCandidValue(user_suspend_field.1)) else return null;
                    ?{
                        user_suspend;
                    };
                };
                case _ null;
            };
    };
};
