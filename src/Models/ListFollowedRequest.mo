import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ListFollowedRequest.mo

module {
    public type ListFollowedRequest = {
        /// The unique identifier of this List.
        list_id : Text;
    };

    public module JSON {
        public func toCandidValue(value : ListFollowedRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("list_id", #Text(value.list_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListFollowedRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?list_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "list_id") else return null;
                    let ?list_id = ((switch (list_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        list_id;
                    };
                };
                case _ null;
            };
    };
};
