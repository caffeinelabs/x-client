
import { type PreviewImageMediaKeyMediaCategory; JSON = PreviewImageMediaKeyMediaCategory } "./PreviewImageMediaKeyMediaCategory";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PreviewImageMediaKey.mo

module {
    /// The required-fields slice of PreviewImageMediaKey — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express PreviewImageMediaKey as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        media : ?Text;
        media_category : ?PreviewImageMediaKeyMediaCategory;
    };

    public type PreviewImageMediaKey = Required and Optional;

    public module JSON {
        // `init` constructs a PreviewImageMediaKey from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PreviewImageMediaKey.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : PreviewImageMediaKey {
            let ?res = from_candid(to_candid(required)) : ?PreviewImageMediaKey else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PreviewImageMediaKey) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.media) {
                case (?v__) List.add(buf, ("media", #Text(v__)));
                case null ();
            };
            switch (value.media_category) {
                case (?v__) List.add(buf, ("media_category", PreviewImageMediaKeyMediaCategory.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PreviewImageMediaKey =
            switch (candid) {
                case (#Record(fields)) {
                    let media : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media")) {
                        case (?media_field) ((switch (media_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let media_category : ?PreviewImageMediaKeyMediaCategory = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category")) {
                        case (?media_category_field) (PreviewImageMediaKeyMediaCategory.fromCandidValue(media_category_field.1));
                        case null null;
                    };
                    ?{
                        media;
                        media_category;
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
