/// A X Community is a curated group of Posts.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Community.mo

module {
    public type Community = {
        created_at : ?Text;
        /// The unique identifier of this Community.
        id : Text;
        /// The name of this Community.
        name : Text;
    };

    public module JSON {
        public func toCandidValue(value : Community) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("name", #Text(value.name)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Community =
            switch (candid) {
                case (#Record(fields)) {
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        created_at;
                        id;
                        name;
                    };
                };
                case _ null;
            };
    };
};
