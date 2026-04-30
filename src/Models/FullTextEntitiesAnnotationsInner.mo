/// Annotation for entities based on the Tweet text.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// FullTextEntitiesAnnotationsInner.mo

module {
    /// The required-fields slice of FullTextEntitiesAnnotationsInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Index (zero-based) at which position this entity ends.  The index is inclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express FullTextEntitiesAnnotationsInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        normalized_text : ?Text;
        probability : ?Float;
        type_ : ?Text;
    };

    public type FullTextEntitiesAnnotationsInner = Required and Optional;

    public module JSON {
        // `init` constructs a FullTextEntitiesAnnotationsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { FullTextEntitiesAnnotationsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : FullTextEntitiesAnnotationsInner {
            let ?res = from_candid(to_candid(required)) : ?FullTextEntitiesAnnotationsInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : FullTextEntitiesAnnotationsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("end", #Nat(value.end)));
            List.add(buf, ("start", #Nat(value.start)));
            switch (value.normalized_text) {
                case (?v__) List.add(buf, ("normalized_text", #Text(v__)));
                case null ();
            };
            switch (value.probability) {
                case (?v__) List.add(buf, ("probability", #Float(v__)));
                case null ();
            };
            switch (value.type_) {
                case (?v__) List.add(buf, ("type", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?FullTextEntitiesAnnotationsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?end_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end") else return null;
                    let ?end = ((switch (end_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let ?start_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start") else return null;
                    let ?start = ((switch (start_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let normalized_text : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "normalized_text")) {
                        case (?normalized_text_field) ((switch (normalized_text_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let probability : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "probability")) {
                        case (?probability_field) ((switch (probability_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let type_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type")) {
                        case (?type__field) ((switch (type__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        end;
                        start;
                        normalized_text;
                        probability;
                        type_;
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
