
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserProtectComplianceSchema.mo

module {
    public type UserProtectComplianceSchema = {
        user_protect : UserComplianceSchema;
    };

    public module JSON {
        // `init` constructs a UserProtectComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserProtectComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            user_protect : UserComplianceSchema;
        }) : UserProtectComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?UserProtectComplianceSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserProtectComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_protect", UserComplianceSchema.toCandidValue(value.user_protect)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserProtectComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_protect_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_protect") else return null;
                    let ?user_protect = (UserComplianceSchema.fromCandidValue(user_protect_field.1)) else return null;
                    ?{
                        user_protect;
                    };
                };
                case _ null;
            };
    };
};
