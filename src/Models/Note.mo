/// A X Community Note is a note on a Post.

import { type NoteInfo; JSON = NoteInfo } "./NoteInfo";

import { type NoteRatingStatus; JSON = NoteRatingStatus } "./NoteRatingStatus";

import { type NoteTestResult; JSON = NoteTestResult } "./NoteTestResult";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Note.mo

module {
    /// The required-fields slice of Note — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The unique identifier of this Community Note.
        id : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Note as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        info : ?NoteInfo;
        status : ?NoteRatingStatus;
        test_result : ?NoteTestResult;
    };

    public type Note = Required and Optional;

    public module JSON {
        // `init` constructs a Note from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Note.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Note {
            let ?res = from_candid(to_candid(required)) : ?Note else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Note) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            switch (value.info) {
                case (?v__) List.add(buf, ("info", NoteInfo.toCandidValue(v__)));
                case null ();
            };
            List.add(buf, ("post_id", #Text(value.post_id)));
            switch (value.status) {
                case (?v__) List.add(buf, ("status", NoteRatingStatus.toCandidValue(v__)));
                case null ();
            };
            switch (value.test_result) {
                case (?v__) List.add(buf, ("test_result", NoteTestResult.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Note =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let info : ?NoteInfo = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "info")) {
                        case (?info_field) (NoteInfo.fromCandidValue(info_field.1));
                        case null null;
                    };
                    let ?post_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "post_id") else return null;
                    let ?post_id = ((switch (post_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let status : ?NoteRatingStatus = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status")) {
                        case (?status_field) (NoteRatingStatus.fromCandidValue(status_field.1));
                        case null null;
                    };
                    let test_result : ?NoteTestResult = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "test_result")) {
                        case (?test_result_field) (NoteTestResult.fromCandidValue(test_result_field.1));
                        case null null;
                    };
                    ?{
                        id;
                        info;
                        post_id;
                        status;
                        test_result;
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
