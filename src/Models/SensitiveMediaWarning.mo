import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SensitiveMediaWarning.mo

module {
    /// The required-fields slice of SensitiveMediaWarning — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express SensitiveMediaWarning as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        adult_content : ?Bool;
        graphic_violence : ?Bool;
        other : ?Bool;
    };

    public type SensitiveMediaWarning = Required and Optional;

    public module JSON {
        // `init` constructs a SensitiveMediaWarning from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SensitiveMediaWarning.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : SensitiveMediaWarning {
            let ?res = from_candid(to_candid(required)) : ?SensitiveMediaWarning else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : SensitiveMediaWarning) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.adult_content) {
                case (?v__) List.add(buf, ("adult_content", #Bool(v__)));
                case null ();
            };
            switch (value.graphic_violence) {
                case (?v__) List.add(buf, ("graphic_violence", #Bool(v__)));
                case null ();
            };
            switch (value.other) {
                case (?v__) List.add(buf, ("other", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SensitiveMediaWarning =
            switch (candid) {
                case (#Record(fields)) {
                    let adult_content : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "adult_content")) {
                        case (?adult_content_field) ((switch (adult_content_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let graphic_violence : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "graphic_violence")) {
                        case (?graphic_violence_field) ((switch (graphic_violence_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let other : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "other")) {
                        case (?other_field) ((switch (other_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        adult_content;
                        graphic_violence;
                        other;
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
