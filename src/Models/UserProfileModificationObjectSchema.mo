
import { type UserComplianceSchemaUser; JSON = UserComplianceSchemaUser } "./UserComplianceSchemaUser";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserProfileModificationObjectSchema.mo

module {
    /// The required-fields slice of UserProfileModificationObjectSchema — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Event time.
        event_at : Text;
        new_value : Text;
        profile_field : Text;
        user : UserComplianceSchemaUser;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UserProfileModificationObjectSchema as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type UserProfileModificationObjectSchema = Required and Optional;

    public module JSON {
        // `init` constructs a UserProfileModificationObjectSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserProfileModificationObjectSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UserProfileModificationObjectSchema {
            let ?res = from_candid(to_candid(required)) : ?UserProfileModificationObjectSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserProfileModificationObjectSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("new_value", #Text(value.new_value)));
            List.add(buf, ("profile_field", #Text(value.profile_field)));
            List.add(buf, ("user", UserComplianceSchemaUser.toCandidValue(value.user)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserProfileModificationObjectSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?new_value_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "new_value") else return null;
                    let ?new_value = ((switch (new_value_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?profile_field_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "profile_field") else return null;
                    let ?profile_field = ((switch (profile_field_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?user_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user") else return null;
                    let ?user = (UserComplianceSchemaUser.fromCandidValue(user_field.1)) else return null;
                    ?{
                        event_at;
                        new_value;
                        profile_field;
                        user;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
