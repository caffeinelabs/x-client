
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserProtectComplianceSchema.mo

module {
    public type UserProtectComplianceSchema = {
        user_protect : UserComplianceSchema;
    };

    public module JSON {
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
