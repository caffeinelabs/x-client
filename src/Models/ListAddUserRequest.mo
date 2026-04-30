import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ListAddUserRequest.mo

module {
    public type ListAddUserRequest = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        user_id : Text;
    };

    public module JSON {
        // `init` constructs a ListAddUserRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ListAddUserRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            user_id : Text;
        }) : ListAddUserRequest {
            let ?res = from_candid(to_candid(required)) : ?ListAddUserRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ListAddUserRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("user_id", #Text(value.user_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListAddUserRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?user_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_id") else return null;
                    let ?user_id = ((switch (user_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        user_id;
                    };
                };
                case _ null;
            };
    };
};
