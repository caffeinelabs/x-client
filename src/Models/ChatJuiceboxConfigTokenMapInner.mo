
import { type ChatJuiceboxConfigTokenMapInnerValue; JSON = ChatJuiceboxConfigTokenMapInnerValue } "./ChatJuiceboxConfigTokenMapInnerValue";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatJuiceboxConfigTokenMapInner.mo

module {
    /// The required-fields slice of ChatJuiceboxConfigTokenMapInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatJuiceboxConfigTokenMapInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        key : ?Text;
        value : ?ChatJuiceboxConfigTokenMapInnerValue;
    };

    public type ChatJuiceboxConfigTokenMapInner = Required and Optional;

    public module JSON {
        // `init` constructs a ChatJuiceboxConfigTokenMapInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatJuiceboxConfigTokenMapInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatJuiceboxConfigTokenMapInner {
            let ?res = from_candid(to_candid(required)) : ?ChatJuiceboxConfigTokenMapInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatJuiceboxConfigTokenMapInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.key) {
                case (?v__) List.add(buf, ("key", #Text(v__)));
                case null ();
            };
            switch (value.value) {
                case (?v__) List.add(buf, ("value", ChatJuiceboxConfigTokenMapInnerValue.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatJuiceboxConfigTokenMapInner =
            switch (candid) {
                case (#Record(fields)) {
                    let key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "key")) {
                        case (?key_field) ((switch (key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let value : ?ChatJuiceboxConfigTokenMapInnerValue = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "value")) {
                        case (?value_field) (ChatJuiceboxConfigTokenMapInnerValue.fromCandidValue(value_field.1));
                        case null null;
                    };
                    ?{
                        key;
                        value;
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
