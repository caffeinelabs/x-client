/// Realm connection details.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatJuiceboxConfigTokenMapInnerValue.mo

module {
    /// The required-fields slice of ChatJuiceboxConfigTokenMapInnerValue — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatJuiceboxConfigTokenMapInnerValue as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        address : ?Text;
        public_key : ?Text;
        token : ?Text;
    };

    public type ChatJuiceboxConfigTokenMapInnerValue = Required and Optional;

    public module JSON {
        // `init` constructs a ChatJuiceboxConfigTokenMapInnerValue from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatJuiceboxConfigTokenMapInnerValue.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatJuiceboxConfigTokenMapInnerValue {
            let ?res = from_candid(to_candid(required)) : ?ChatJuiceboxConfigTokenMapInnerValue else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatJuiceboxConfigTokenMapInnerValue) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.address) {
                case (?v__) List.add(buf, ("address", #Text(v__)));
                case null ();
            };
            switch (value.public_key) {
                case (?v__) List.add(buf, ("public_key", #Text(v__)));
                case null ();
            };
            switch (value.token) {
                case (?v__) List.add(buf, ("token", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatJuiceboxConfigTokenMapInnerValue =
            switch (candid) {
                case (#Record(fields)) {
                    let address : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "address")) {
                        case (?address_field) ((switch (address_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key")) {
                        case (?public_key_field) ((switch (public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token")) {
                        case (?token_field) ((switch (token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        address;
                        public_key;
                        token;
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
