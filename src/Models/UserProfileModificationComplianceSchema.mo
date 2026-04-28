
import { type UserProfileModificationObjectSchema; JSON = UserProfileModificationObjectSchema } "./UserProfileModificationObjectSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserProfileModificationComplianceSchema.mo

module {
    public type UserProfileModificationComplianceSchema = {
        user_profile_modification : UserProfileModificationObjectSchema;
    };

    public module JSON {
        public func toCandidValue(value : UserProfileModificationComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_profile_modification", UserProfileModificationObjectSchema.toCandidValue(value.user_profile_modification)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserProfileModificationComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_profile_modification_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_profile_modification") else return null;
                    let ?user_profile_modification = (UserProfileModificationObjectSchema.fromCandidValue(user_profile_modification_field.1)) else return null;
                    ?{
                        user_profile_modification;
                    };
                };
                case _ null;
            };
    };
};
