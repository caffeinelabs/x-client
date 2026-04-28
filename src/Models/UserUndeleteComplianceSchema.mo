
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserUndeleteComplianceSchema.mo

module {
    public type UserUndeleteComplianceSchema = {
        user_undelete : UserComplianceSchema;
    };

    public module JSON {
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
