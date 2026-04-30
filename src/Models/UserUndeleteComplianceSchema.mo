
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserUndeleteComplianceSchema.mo

module {
    public type UserUndeleteComplianceSchema = {
        user_undelete : UserComplianceSchema;
    };

    public module JSON {
        // `init` constructs a UserUndeleteComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserUndeleteComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            user_undelete : UserComplianceSchema;
        }) : UserUndeleteComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?UserUndeleteComplianceSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserUndeleteComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_undelete", UserComplianceSchema.toCandidValue(value.user_undelete)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserUndeleteComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_undelete_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_undelete") else return null;
                    let ?user_undelete = (UserComplianceSchema.fromCandidValue(user_undelete_field.1)) else return null;
                    ?{
                        user_undelete;
                    };
                };
                case _ null;
            };
    };
};
