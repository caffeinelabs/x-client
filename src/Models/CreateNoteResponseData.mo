import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateNoteResponseData.mo

module {
    public type CreateNoteResponseData = {
        /// The unique identifier of this Community Note.
        id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateNoteResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateNoteResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        id;
                    };
                };
                case _ null;
            };
    };
};
