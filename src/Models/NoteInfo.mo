/// A X Community Note is a note on a Post.

import { type MisleadingTags; JSON = MisleadingTags } "./MisleadingTags";

import { type NoteClassification; JSON = NoteClassification } "./NoteClassification";

// NoteInfo.mo

module {
    // User-facing type: what application code uses
    public type NoteInfo = {
        classification : NoteClassification;
        misleading_tags : [MisleadingTags];
        /// The text summary in the Community Note.
        text_ : Text;
        /// Whether the note provided trustworthy links.
        trustworthy_sources : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer NoteInfo type
        public type JSON = {
            classification : NoteClassification.JSON;
            misleading_tags : [MisleadingTags];
            text_ : Text;
            trustworthy_sources : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : NoteInfo) : JSON = { value with
            classification = NoteClassification.toJSON(value.classification);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?NoteInfo {
            let ?classification = NoteClassification.fromJSON(json.classification) else return null;
            ?{ json with
                classification;
            }
        };
    }
}
