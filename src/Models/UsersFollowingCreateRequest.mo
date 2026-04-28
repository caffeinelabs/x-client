import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UsersFollowingCreateRequest.mo

module {
    public type UsersFollowingCreateRequest = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        target_user_id : Text;
    };

    public module JSON {
        public func toCandidValue(value : UsersFollowingCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("target_user_id", #Text(value.target_user_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersFollowingCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?target_user_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "target_user_id") else return null;
                    let ?target_user_id = ((switch (target_user_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        target_user_id;
                    };
                };
                case _ null;
            };
    };
};
