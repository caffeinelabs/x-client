
import { type NoteInfo; JSON = NoteInfo } "./NoteInfo";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateNoteRequest.mo

module {
    public type CreateNoteRequest = {
        info : NoteInfo;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : Text;
        /// If true, the note being submitted is only for testing the capability of the bot, and won't be publicly visible. If false, the note being submitted will be a new proposed note on the product.
        test_mode : Bool;
    };

    public module JSON {
        public func toCandidValue(value : CreateNoteRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("info", NoteInfo.toCandidValue(value.info)));
            List.add(buf, ("post_id", #Text(value.post_id)));
            List.add(buf, ("test_mode", #Bool(value.test_mode)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateNoteRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?info_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "info") else return null;
                    let ?info = (NoteInfo.fromCandidValue(info_field.1)) else return null;
                    let ?post_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "post_id") else return null;
                    let ?post_id = ((switch (post_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?test_mode_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "test_mode") else return null;
                    let ?test_mode = ((switch (test_mode_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        info;
                        post_id;
                        test_mode;
                    };
                };
                case _ null;
            };
    };
};
