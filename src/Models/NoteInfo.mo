/// A X Community Note is a note on a Post.

import { type MisleadingTags; JSON = MisleadingTags } "./MisleadingTags";

import { type NoteClassification; JSON = NoteClassification } "./NoteClassification";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// NoteInfo.mo

module {
    /// The required-fields slice of NoteInfo — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        classification : NoteClassification;
        misleading_tags : [MisleadingTags];
        /// The text summary in the Community Note.
        text_ : Text;
        /// Whether the note provided trustworthy links.
        trustworthy_sources : Bool;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express NoteInfo as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type NoteInfo = Required and Optional;

    public module JSON {
        // `init` constructs a NoteInfo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { NoteInfo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : NoteInfo {
            let ?res = from_candid(to_candid(required)) : ?NoteInfo else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : NoteInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("classification", NoteClassification.toCandidValue(value.classification)));
            List.add(buf, ("misleading_tags", #Array(Array.map<MisleadingTags, Candid.Candid>(value.misleading_tags, MisleadingTags.toCandidValue))));
            List.add(buf, ("text", #Text(value.text_)));
            List.add(buf, ("trustworthy_sources", #Bool(value.trustworthy_sources)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?NoteInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let ?classification_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "classification") else return null;
                    let ?classification = (NoteClassification.fromCandidValue(classification_field.1)) else return null;
                    let ?misleading_tags_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "misleading_tags") else return null;
                    let ?misleading_tags = ((switch (misleading_tags_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<MisleadingTags>();
                            for (c__ in xs__.values()) {
                                let ?e__ = MisleadingTags.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?trustworthy_sources_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "trustworthy_sources") else return null;
                    let ?trustworthy_sources = ((switch (trustworthy_sources_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        classification;
                        misleading_tags;
                        text_;
                        trustworthy_sources;
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
