import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// DeleteNoteResponseData.mo

module {
    public type DeleteNoteResponseData = {
        deleted : Bool;
    };

    public module JSON {
        public func toCandidValue(value : DeleteNoteResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("deleted", #Bool(value.deleted)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteNoteResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?deleted_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "deleted") else return null;
                    let ?deleted = ((switch (deleted_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        deleted;
                    };
                };
                case _ null;
            };
    };
};
