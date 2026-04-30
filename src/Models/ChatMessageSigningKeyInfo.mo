/// Signing key information for message verification.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMessageSigningKeyInfo.mo

module {
    /// The required-fields slice of ChatMessageSigningKeyInfo — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatMessageSigningKeyInfo as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        member_id : ?Text;
        public_key_version : ?Text;
        signing_public_key : ?Text;
    };

    public type ChatMessageSigningKeyInfo = Required and Optional;

    public module JSON {
        // `init` constructs a ChatMessageSigningKeyInfo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMessageSigningKeyInfo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatMessageSigningKeyInfo {
            let ?res = from_candid(to_candid(required)) : ?ChatMessageSigningKeyInfo else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMessageSigningKeyInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.member_id) {
                case (?v__) List.add(buf, ("member_id", #Text(v__)));
                case null ();
            };
            switch (value.public_key_version) {
                case (?v__) List.add(buf, ("public_key_version", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key) {
                case (?v__) List.add(buf, ("signing_public_key", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMessageSigningKeyInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let member_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "member_id")) {
                        case (?member_id_field) ((switch (member_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let public_key_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key_version")) {
                        case (?public_key_version_field) ((switch (public_key_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key")) {
                        case (?signing_public_key_field) ((switch (signing_public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        member_id;
                        public_key_version;
                        signing_public_key;
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
