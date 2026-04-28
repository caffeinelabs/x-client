/// The X Topic object.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SpaceTopicsInner.mo

module {
    public type SpaceTopicsInner = {
        /// The description of the given topic.
        description : ?Text;
        /// An ID suitable for use in the REST API.
        id : Text;
        /// The name of the given topic.
        name : Text;
    };

    public module JSON {
        public func toCandidValue(value : SpaceTopicsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.description) {
                case (?v__) List.add(buf, ("description", #Text(v__)));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("name", #Text(value.name)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SpaceTopicsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) ((switch (description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        description;
                        id;
                        name;
                    };
                };
                case _ null;
            };
    };
};
