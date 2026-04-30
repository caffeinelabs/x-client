
import { type NoteInfo; JSON = NoteInfo } "./NoteInfo";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateNoteRequest.mo

module {
    /// The required-fields slice of CreateNoteRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        info : NoteInfo;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : Text;
        /// If true, the note being submitted is only for testing the capability of the bot, and won't be publicly visible. If false, the note being submitted will be a new proposed note on the product.
        test_mode : Bool;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateNoteRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateNoteRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateNoteRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateNoteRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateNoteRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateNoteRequest else Runtime.unreachable();
            res
        };

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

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
