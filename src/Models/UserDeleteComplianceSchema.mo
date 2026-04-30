
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserDeleteComplianceSchema.mo

module {
    public type UserDeleteComplianceSchema = {
        user_delete : UserComplianceSchema;
    };

    public module JSON {
        // `init` constructs a UserDeleteComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserDeleteComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            user_delete : UserComplianceSchema;
        }) : UserDeleteComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?UserDeleteComplianceSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserDeleteComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_delete", UserComplianceSchema.toCandidValue(value.user_delete)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserDeleteComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_delete_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_delete") else return null;
                    let ?user_delete = (UserComplianceSchema.fromCandidValue(user_delete_field.1)) else return null;
                    ?{
                        user_delete;
                    };
                };
                case _ null;
            };
    };
};
