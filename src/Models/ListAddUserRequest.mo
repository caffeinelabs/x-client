import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ListAddUserRequest.mo

module {
    public type ListAddUserRequest = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        user_id : Text;
    };

    public module JSON {
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
