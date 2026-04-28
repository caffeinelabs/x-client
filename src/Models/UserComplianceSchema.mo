
import { type UserComplianceSchemaUser; JSON = UserComplianceSchemaUser } "./UserComplianceSchemaUser";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserComplianceSchema.mo

module {
    public type UserComplianceSchema = {
        /// Event time.
        event_at : Text;
        user : UserComplianceSchemaUser;
    };

    public module JSON {
        public func toCandidValue(value : UserComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("user", UserComplianceSchemaUser.toCandidValue(value.user)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?user_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user") else return null;
                    let ?user = (UserComplianceSchemaUser.fromCandidValue(user_field.1)) else return null;
                    ?{
                        event_at;
                        user;
                    };
                };
                case _ null;
            };
    };
};
