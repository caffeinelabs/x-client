
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserDeleteComplianceSchema.mo

module {
    public type UserDeleteComplianceSchema = {
        user_delete : UserComplianceSchema;
    };

    public module JSON {
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
