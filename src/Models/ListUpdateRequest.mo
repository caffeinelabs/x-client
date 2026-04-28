import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ListUpdateRequest.mo

module {
    public type ListUpdateRequest = {
        description : ?Text;
        name : ?Text;
        private_ : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : ListUpdateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.description) {
                case (?v__) List.add(buf, ("description", #Text(v__)));
                case null ();
            };
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            switch (value.private_) {
                case (?v__) List.add(buf, ("private", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListUpdateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) ((switch (description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let private_ : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "private")) {
                        case (?private__field) ((switch (private__field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        description;
                        name;
                        private_;
                    };
                };
                case _ null;
            };
    };
};
