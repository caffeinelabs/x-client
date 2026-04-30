
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserSuspendComplianceSchema.mo

module {
    public type UserSuspendComplianceSchema = {
        user_suspend : UserComplianceSchema;
    };

    public module JSON {
        // `init` constructs a UserSuspendComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserSuspendComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            user_suspend : UserComplianceSchema;
        }) : UserSuspendComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?UserSuspendComplianceSchema else Runtime.unreachable();
            res
        };

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
