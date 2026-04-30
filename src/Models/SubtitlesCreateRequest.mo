
import { type MediaCategorySubtitles; JSON = MediaCategorySubtitles } "./MediaCategorySubtitles";

import { type Subtitles; JSON = Subtitles } "./Subtitles";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SubtitlesCreateRequest.mo

module {
    /// The required-fields slice of SubtitlesCreateRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express SubtitlesCreateRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        id : ?Text;
        media_category : ?MediaCategorySubtitles;
        subtitles : ?Subtitles;
    };

    public type SubtitlesCreateRequest = Required and Optional;

    public module JSON {
        // `init` constructs a SubtitlesCreateRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SubtitlesCreateRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : SubtitlesCreateRequest {
            let ?res = from_candid(to_candid(required)) : ?SubtitlesCreateRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : SubtitlesCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.media_category) {
                case (?v__) List.add(buf, ("media_category", MediaCategorySubtitles.toCandidValue(v__)));
                case null ();
            };
            switch (value.subtitles) {
                case (?v__) List.add(buf, ("subtitles", Subtitles.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubtitlesCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let media_category : ?MediaCategorySubtitles = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category")) {
                        case (?media_category_field) (MediaCategorySubtitles.fromCandidValue(media_category_field.1));
                        case null null;
                    };
                    let subtitles : ?Subtitles = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subtitles")) {
                        case (?subtitles_field) (Subtitles.fromCandidValue(subtitles_field.1));
                        case null null;
                    };
                    ?{
                        id;
                        media_category;
                        subtitles;
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
