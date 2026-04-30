
import { type UserTakedownComplianceSchema; JSON = UserTakedownComplianceSchema } "./UserTakedownComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserWithheldComplianceSchema.mo

module {
    public type UserWithheldComplianceSchema = {
        user_withheld : UserTakedownComplianceSchema;
    };

    public module JSON {
        // `init` constructs a UserWithheldComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserWithheldComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            user_withheld : UserTakedownComplianceSchema;
        }) : UserWithheldComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?UserWithheldComplianceSchema else Runtime.unreachable();
            res
        };

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
