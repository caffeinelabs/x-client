import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// EvaluateNoteRequest.mo

module {
    public type EvaluateNoteRequest = {
        /// Text for the community note.
        note_text : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : Text;
    };

    public module JSON {
        public func toCandidValue(value : EvaluateNoteRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("note_text", #Text(value.note_text)));
            List.add(buf, ("post_id", #Text(value.post_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EvaluateNoteRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?note_text_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "note_text") else return null;
                    let ?note_text = ((switch (note_text_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?post_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "post_id") else return null;
                    let ?post_id = ((switch (post_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        note_text;
                        post_id;
                    };
                };
                case _ null;
            };
    };
};
