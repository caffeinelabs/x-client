import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// EvaluateNoteRequest.mo

module {
    /// The required-fields slice of EvaluateNoteRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Text for the community note.
        note_text : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express EvaluateNoteRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type EvaluateNoteRequest = Required and Optional;

    public module JSON {
        // `init` constructs a EvaluateNoteRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { EvaluateNoteRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : EvaluateNoteRequest {
            let ?res = from_candid(to_candid(required)) : ?EvaluateNoteRequest else Runtime.unreachable();
            res
        };

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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
