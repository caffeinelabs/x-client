
import { type MediaCategorySubtitles; JSON = MediaCategorySubtitles } "./MediaCategorySubtitles";

import { type Subtitles; JSON = Subtitles } "./Subtitles";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SubtitlesCreateResponseData.mo

module {
    /// The required-fields slice of SubtitlesCreateResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        associated_subtitles : [Subtitles];
        /// The unique identifier of this Media.
        id : Text;
        media_category : MediaCategorySubtitles;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express SubtitlesCreateResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type SubtitlesCreateResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a SubtitlesCreateResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SubtitlesCreateResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : SubtitlesCreateResponseData {
            let ?res = from_candid(to_candid(required)) : ?SubtitlesCreateResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : SubtitlesCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("associated_subtitles", #Array(Array.map<Subtitles, Candid.Candid>(value.associated_subtitles, Subtitles.toCandidValue))));
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("media_category", MediaCategorySubtitles.toCandidValue(value.media_category)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubtitlesCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?associated_subtitles_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "associated_subtitles") else return null;
                    let ?associated_subtitles = ((switch (associated_subtitles_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Subtitles>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Subtitles.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?media_category_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category") else return null;
                    let ?media_category = (MediaCategorySubtitles.fromCandidValue(media_category_field.1)) else return null;
                    ?{
                        associated_subtitles;
                        id;
                        media_category;
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
