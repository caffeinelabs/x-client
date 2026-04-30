
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserUnsuspendComplianceSchema.mo

module {
    public type UserUnsuspendComplianceSchema = {
        user_unsuspend : UserComplianceSchema;
    };

    public module JSON {
        // `init` constructs a UserUnsuspendComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserUnsuspendComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            user_unsuspend : UserComplianceSchema;
        }) : UserUnsuspendComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?UserUnsuspendComplianceSchema else Runtime.unreachable();
            res
        };

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
