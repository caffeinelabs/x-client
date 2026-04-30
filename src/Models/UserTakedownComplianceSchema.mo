
import { type UserComplianceSchemaUser; JSON = UserComplianceSchemaUser } "./UserComplianceSchemaUser";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserTakedownComplianceSchema.mo

module {
    public type UserTakedownComplianceSchema = {
        /// Event time.
        event_at : Text;
        user : UserComplianceSchemaUser;
        withheld_in_countries : [Text];
    };

    public module JSON {
        // `init` constructs a UserTakedownComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserTakedownComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            event_at : Text;
            user : UserComplianceSchemaUser;
            withheld_in_countries : [Text];
        }) : UserTakedownComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?UserTakedownComplianceSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserTakedownComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("user", UserComplianceSchemaUser.toCandidValue(value.user)));
            List.add(buf, ("withheld_in_countries", #Array(Array.map<Text, Candid.Candid>(value.withheld_in_countries, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserTakedownComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?user_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user") else return null;
                    let ?user = (UserComplianceSchemaUser.fromCandidValue(user_field.1)) else return null;
                    let ?withheld_in_countries_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "withheld_in_countries") else return null;
                    let ?withheld_in_countries = ((switch (withheld_in_countries_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        event_at;
                        user;
                        withheld_in_countries;
                    };
                };
                case _ null;
            };
    };
};
